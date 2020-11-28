const router = require("express").Router();
const passport = require("passport");


// login using Google
router.get("/google", passport.authenticate("google", {scope:["profile","email"]}));

// if login succeed, redirect here
router.get("/google/redirect",passport.authenticate("google"), (req,res) => {
    // res.send("Login OK, show profile");
    // res.send(req.user);
    res.redirect("/newmain");
}),

// logout
router.get("/logout", (req,res) =>{
    req.logOut();
    res.redirect("/login");
});
module.exports = router;