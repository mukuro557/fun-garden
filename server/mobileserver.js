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
 
app.get("/welcome", function(req, res) {
    res.send("Welcome to you!");
});

//------------------------- Login-------------------------------------
app.post("/login", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
 
    const sql = "SELECT Password,Role,Username FROM user WHERE Username = ?";
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
 
const port = process.env.PORT || 35000;
app.listen(port, function(){
    console.log("Server is ready at " + port);
});
