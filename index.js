require('dotenv').config()

const express = require('express');
const app = express();
const mongoose = require('mongoose');

mongoose.connect(process.env.DATABASE_URL, { useUnifiedTopology: true, useNewUrlParser: true }, () => {
    console.log('Database Connected Successfully')
});

// cofigure our server
app.use(express.json());
app.get('/', (req,res)=>{
    res.send('ok ')
})




app.listen(process.env.PORT, () => {
    console.log("server started");
});