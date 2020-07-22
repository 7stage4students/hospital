const express = require('express');
const router = express.Router();

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
          res.render('user/profile');
     }
     });
});
    
   
router.get('/dashboard',(req,res)=>{
     res.render('user/dashboard',{dash:'active'});
})

router.get('/profile',(req,res)=>{
     res.render('user/profile',{pro:'active'});
})

router.get('/logs',(req,res)=>{
     res.render('user/logs',{logs:'active'});
})
   module.exports = router