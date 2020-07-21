
require('dotenv').config()

const express = require('express');
const path = require('path')
const adminRouter = require('./routes/admin')
const userRouter = require('./routes/user');
const cookieParser= require('cookie-parser');
const userTracker = require('./utils/userTracker')
const exphbs = require("express-handlebars");
const mongoose = require('mongoose');

const app = express();

mongoose.connect(process.env.DATABASE_URL, { useUnifiedTopology: true, useNewUrlParser: true }, (err,res) => { 
   console.log('Connected to Database');
});


app.use(cookieParser())
app.use('/',userTracker)

app.engine("handlebars", exphbs({partialsDir: path.join(__dirname + '/views/partials') } ));
app.set("view engine", "handlebars");
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());

app.get('/',(req,res)=>{
     res.render('home')
})
app.get('/login',(req,res)=>{
    res.redirect('user/login')
})
app.get('/signup',(req,res)=>{
    res.redirect('user/register')
})

app.use('/admin', adminRouter);
app.use('/user', userRouter)


app.listen(process.env.PORT, () => {
    console.log("server started");
});

