const express = require('express');
const auth = require('../controlers/auth');
const formidable = require('formidable');
const {getAll,getById} = require('../controlers/admin');


const form = formidable({ multiples: true });
const router = express.Router();


router.use(express.json())

   router.get('/login', (req,res)=>{
         res.render('adminlogin'); 
   });

   router.post('/login', (req,res)=>{

    form.parse(req, (err, fields, files) => {
        if (err) {
            next(err);
            return;
        }
        else{
           if(files);
            console.log(fields);
            auth.postAdminLogin(fields,res,null);
        }
    });
    //    res.render('addmin')

   });

   router.get('/home',(req, res)=>{
       if(req.user){
           res.render('adminpage')
       }else
           res.render('adminlogin');
   })

router.get('/patients/all',(req, res) =>{
    console.log('Getting all ');
    console.log(req.user)
    if (req.user)
        getAll(res);
    else
         res.render('adminlogin');     

})

router.get('/data/all',(req, res) =>{
    console.log('Getting all ');
    console.log(req.user)
    if (req.user){
        getAll(res);
    }else
    res.render('adminlogin');     

})

router.get('/patient/:id',( req, res )=>{
    
    let id = req.params.id;
//    let sample = 'YQXWzHavQAMl6U1YjOURvlv9u3O0N9xR7KQ5F9ekPj0=';
    if (req.user){
        getById(id,res)
    }else
        res.render('adminlogin');      
});

   router.post('/add',( req, res )=>{
        if (req.user){
            res.send('Adding single patient')
        }else
            res.render('adminlogin');
        
   });

    router.patch('/update/:id',( req, res )=>{
        if (req.user)
            res.render('Updating a user')
        else
            res.render('/admin/login');
       
    });


   module.exports = router
