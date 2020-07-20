const express = require('express');
const router = express.Router();
router.use(express.json())
const formidable = require('formidable');
const form = formidable({ multiples: true });
const adminController = require('../controlers/Admin');
const auth = require('../controlers/Auth')
   router.get('/login', (req,res)=>{
    //    res.render('addmin')
    res.render('adminlogin'); 
   });

   router.post('/login', (req,res)=>{

    form.parse(req, (err, fields, files) => {
        if (err) {
            next(err);
            return;
        }
        else{
            console.log(fields);
            auth.postAdminLogin(fields,res,null);
        }
    });
    //    res.render('addmin')

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

   router.get("/patient/:code", (req, res)=>{
       var patientsCode = req.params.code;
       console.log(`searching for patient with code ${patientsCode}`);
       res.send(req.params.code);
   });

   module.exports = router