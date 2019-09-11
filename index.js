const express = require("express");

const app = express();


app.get("/", (req, res) => {    
        res.send("Your node application running successfully");   
});


app.listen(8082, () => {
    console.log("listening to port 8082");
});
