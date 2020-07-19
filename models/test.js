require('dotenv').config()

const mongoose = require('mongoose');

let Patient = require('./patientSchema');
let Doctor = require('./doctorSchema');

let doctorData;
let patientData;

mongoose.connect(process.env.DATABASE_URL,{ useNewUrlParser: true, useUnifiedTopology: true  },()=>{
    console.log('connected to DB');

    try{

        patientData = new Patient({
        name:"Kimbi", 
        age:1,
        email: 'lesra@ahoo.com',
        password: 'mongo',
        disease : ['over feeding','making Long calls'],
        logs:[
            {
                test : ['Hypertitis'],
                medicine: [
                    'paracetamol',
                    'tramol',
                    'sugar']
        }]
     })
    
    doctorData = new Doctor({
    name: 'Dr Divine',
    password: 'Cookie',
    age: 17,
    email: 'doctore@gmail.com',
    hostpital: 'Dovinde',
    speciality: ['Somethingn']
    }) 

    }catch (e) {
        console.log(' I am here');
        console.log(e);
        }

     try {
        patientData.save();
        doctorData.save();
         console.log('successfully Saved the data');
        }catch(err){
        console.log(err);
        }
    
})

