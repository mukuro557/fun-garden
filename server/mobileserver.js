const express = require('express');
const app = express();
const authRoutes = require("../routes/auth-routes");
const profileRoutes = require("../routes/profile-routes");
const passportSetup = require("../config/passport-setup");
const config = require('../dbConfig.js');
const mysql = require('mysql');
const passport = require("passport");
const bcrypt = require('bcrypt');
const con = mysql.createConnection(config);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// authen
app.use("/auth", authRoutes);
// profle
app.use("/profile", profileRoutes);

app.get("/welcome", function (req, res) {
    res.send("Welcome to you!");
});

//------------------------- Login-------------------------------------
app.post("/login", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;

    const sql = "SELECT * FROM user WHERE Username = ?";
    con.query(sql, [username], function (err, result, fields) {
        if (err) {
            console.error(err.message);
            res.status(500).send("Database server error");
            return;
        }

        const numrows = result.length;
        //if no data
        if (numrows == 0) {
            res.status(400).send("Login failed");
        }
        else {

            bcrypt.compare(password, result[0].Password, function (err, resp) {
                if (err) {
                    console.log(result[0])
                    console.error(err.message);
                    res.status(500).send("Password matching error");
                    return;
                }

                if (resp == true) {
                    //correct login
                    res.json(result[0]);
                }
                else {
                    res.status(401).send("Login failed");
                }
            });
        }
    });
});

//-------------------------- Register ------------------------
app.post("/register", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;

    //checked existing username
    let sql = "SELECT User_id FROM user WHERE Username=?";
    con.query(sql, [username], function (err, result, fields) {
        if (err) {
            console.error(err.message);
            res.status(500).send("Database server error");
            return;
        }

        const numrows = result.length;
        //if repeated username
        if (numrows > 0) {
            res.status(400).send("Sorry, this username exists");
        }
        else {
            bcrypt.hash(password, 10, function (err, hash) {
                //return hashed password, 60 characters
                sql = "INSERT INTO user(Username, Password) VALUES (?,?)";
                con.query(sql, [username, hash], function (err, result, fields) {
                    if (err) {
                        console.error(err.message);
                        res.status(500).send("Database server error");
                        return;
                    }

                    const numrows = result.affectedRows;
                    if (numrows != 1) {
                        res.status(500).send("Insert failed");
                    }
                    else {
                        res.send("Register done");
                    }
                });
            });
        }
    });
});
app.post("/fruit_info", function (req, res) {
    const id = req.body.id;
    let sql = "SELECT * FROM sell WHERE Sell_id=?";
    con.query(sql, [username], function (err, result, fields) {

        if (err) {
            console.error(err.message);
            res.status(500).send("Database server error");
            return;
        }
        const numrows = result.affectedRows;
        if (numrows < 1) {
            res.status(500).send("no information");
        }
        else {
            res.json(result);
        }
    })
});

app.get("/allfruit", function (req, res) {
    let sql = "SELECT sell.Sell_id,sell.Fruit,sell.Date_end,sell.Price, farm.* FROM farm RIGHT JOIN sell ON farm.Farm_id = sell.Farm_id";
    con.query(sql, function (err, result, fields) {

        if (err) {
            console.error(err.message);
            res.status(500).send("Database server error");
            return;
        }
        const numrows = result.affectedRows;
        if (numrows < 1) {
            res.status(500).send("no information");
        }
        else {
            
            res.json(result);


        }
    })
});

app.post("/allfarminfoauc", function (req, res) {
    const id = req.body.id;

    let sql = "SELECT farm.Farm_name,farm.Address,farm.Tel1,sell.*,farm.Descript FROM farm RIGHT JOIN sell ON farm.Farm_id = sell.Farm_id WHERE sell.Sell_id =?";
    con.query(sql,[id], function (err, result, fields) {

        if (err) {
            console.error(err.message);
            res.status(500).send("Database server error");
            return;
        }
        const numrows = result.affectedRows;
        if (numrows < 1) {
            res.status(500).send("no information");
        }
        else {
            res.json(result);
            console.log(result);
        }
    })
});

app.post("/image", function (req, res) {
    const id = req.body.id;
    console.log(id);
    let sql = "SELECT * FROM image WHERE Sell_id = ? ";
    con.query(sql, [id], function (err, result, fields) {

        if (err) {
            console.error(err.message);
            res.status(500).send("Database server error");
            return;
        }
        const numrows = result.affectedRows;
        if (numrows < 1) {
            res.status(500).send("no information");
        }
        else {
            res.json(result);
            console.log(result[0].image);
        }
    })
});

app.post("/auctionsstart", function (req, res) {
    const id_user = req.body.id_user;
    const id_sell = req.body.id_sell;
    const price = req.body.price;
    const id = req.body.id;

    let sql = "INSERT INTO auction(Auctioneer,Sell_id,price) VALUES (?,?,?)";
    con.query(sql, [id_user,id_sell,price], function (err, result, fields) {
        if (err) {
            console.error(err.message);
            res.status(503).send("เซิร์ฟเวอร์ไม่ตอบสนอง");
            return;
        }
        // get inserted rows
        const numrows = result.affectedRows;
        if (numrows != 1) {
            console.error("Error");
            res.status(500).send("ไม่สามารถเพิ่มข้อมูลได้");
        }
        else {
            res.send("เพิ่มข้อมูลเรียบร้อย");
        }
    })
});

const port = process.env.PORT || 35000;
app.listen(port, function () {
    console.log("Server is ready at " + port);
});
