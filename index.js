const dotenv = require('dotenv').config()
const express = require('express');
const addminRouter = require('./routes/addmin')
const userLoginRouter = require('./routes/userLogin')
const app = express();
const mongoose = require('mongoose');
mongoose.connect(process.env.DATABASE_URL, { useUnifiedTopology: true, useNewUrlParser: true }, () => { });
const db = mongoose.connection;
db.on('error', (err) => {
    console.error('The error is', err)
});

db.once('open', () => {
    console.log('connected to database')
})
// cofigure our server
app.use(express.json());
app.get('/', (req,res)=>{
    res.send('ok ')
})
app.get('/',(req,res)=>{
     res.render('home')
})
app.use('/patient', addminRouter);
app.use('/patient', userLoginRouter)


app.listen(process.env.PORT, () => {
    console.log("server started");
});