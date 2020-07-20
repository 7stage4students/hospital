const express = require('express');
const router = express.Router();
const auth = require('../controlers/Auth');
const formidable = require('formidable');
const form = formidable({ multiples: true });
let user = {
     name:'zidane',
     password:'zidane'
}
   router.post('/login', (req,res)=>{
     form.parse(req, (err, fields, files) => {
          if (err) {
              next(err);
              return;
          }
          else{
             res.render('userpage');
          }
      });
   });
    
    router.post('userLogin', (req,res)=>{
         res.send('User login')
    })
   
     router.get('/user',( req, res )=>{
    //    res.render('user')
        res.send('display the users page')
   });

   module.exports = router