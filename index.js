require('dotenv').config()

const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require('body-parser')
const mongoose = require('mongoose');

mongoose.connect(process.env.DATABASE_URL, { useUnifiedTopology: true, useNewUrlParser: true }, () => { });
const db = mongoose.connection;

db.on('error', (err) => {
    console.error('The error is', err)
});

db.once('open', () => {
    console.log('connected to database')
})


app.use(express.json());
app.get('/', (req,res)=>{
    res.send('ok ')
})


app.listen(process.env.PORT, () => {
    console.log("server started");
});

