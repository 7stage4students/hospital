const express = require('express');
const router = express.Router();
   router.get('/addmin', (req,res)=>{
    //    res.render('addmin')
    res.send('Displaying')
   });

   router.get('/addmin/:id',( req, res )=>{
       res.send('Getting  a single patient')
   });

   router.post('/addmin/add',( req, res )=>{
    // res.render('user')
    res.send('adding a new user')
   });

router.patch('/addmin/update/:id',( req, res )=>{
      res.render('Updating a user')
   });

   router.delete('/addmin/delete/:id', (req,res)=>{
       res.send('A user has been deleted')
   })

   module.exports = router