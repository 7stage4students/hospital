
require('dotenv').config()

const express = require('express');
const addminRouter = require('./routes/addmin')
const userLoginRouter = require('./routes/userLogin')
const app = express();
const path = require('path');
const bodyParser = require('body-parser')
const mongoose = require('mongoose');
const exphbs = require("express-handlebars");

mongoose.connect(process.env.DATABASE_URL, { useUnifiedTopology: true, useNewUrlParser: true }, () => { });
const db = mongoose.connection;

db.on('error', (err) => {
    console.error('The error is', err)
});

db.once('open', () => {
    console.log('connected to database')
})

app.engine("handlebars", exphbs({partialsDir: path.join(__dirname + '/views/partials') } ));
app.set("view engine", "handlebars");
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());

app.get('/',(req,res)=>{
     res.render('home')
})
app.use('/patient', addminRouter);
app.use('/patient', userLoginRouter)


app.listen(process.env.PORT, () => {
    console.log("server started");
});

