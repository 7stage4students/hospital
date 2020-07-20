const express = require('express');
const router = express.Router();
   router.get('/login', (req,res)=>{
    //    res.render('/login')
    res.send('Display the login page')
   });
    
    router.post('userLogin', (req,res)=>{
         res.send('User login')
    })
   
     router.get('/user',( req, res )=>{
    //    res.render('user')
        res.send('display the users page')
   });

   module.exports = router