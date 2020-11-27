const express = require('express');
const app = express();
 
app.get("/welcome", function(req, res) {
    res.send("Welcome to you!");
});
 
const port = process.env.PORT || 35000;
app.listen(port, function(){
    console.log("Server is ready at " + port);
});
