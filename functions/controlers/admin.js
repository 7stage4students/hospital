const Doctors = require('../models/doctorSchema');
const bcrypt = require('bcrypt');
const Patient = require('../models/patientSchema');
const crypto= require('crypto');
const { getHashedPassword } = require("./getHashedPassword");
const { json } = require('express');


//GeT All Patients
exports.
getAll = async(res)=>{
        let data = {}
   // console.log(await Patient.find({}))
   await Patient.find({},(err,result)=>{
       // console.log(result)
      data = JSON.stringify(result)
    })
    return   data;
}

//Get By ID
exports.
getById = async(id,res) =>{
    Patient.find({_id: id},(err,result)=>{
        res.json(result)
    })
}



//ADMIN ADD PATIENT
exports.postAddPatient = (fields, res, next) => {
const name = fields.name;
const email = fields.email;
const age = fields.age;
const password = getHashedPassword(fields.password)
let diseases,test,medicine;
if(fields.disease){
    diseases = fields.diseases.split(',');
    test = Array.from(fields.test)
    medicine = fields.medicine.split(',');
}


const patient = new Patient({
    name: name,
    email: email,
    age: age,
    password: password,
    diseases: diseases,
    logs: [{test: [test], medicine: [medicine]}]
  });

  patient
    .save()
    .then(result => {
      // console.log(result);
      console.log('Created Patient');
      res.redirect('adminpage');
    })
    .catch(err => {
      console.log(err);
    });

    res.send('Registered Successfullly')
};

//ADMIN UPDATE PATIENT DETAILS
module.exports.postUpdate = (req,res,next) => {
    const name = req.body.name;
    const email = req.body.email;
    const age = req.body.age;
    const password = getHashedPassword(req.body.password)
    const diseases = req.body.diseases.split(',');
    const test = Array.from(req.body.test)
    const medicine = req.body.medicine.split(',');
    const update = {name: name,email: email,password: password,disease: diseases,logs: [{test: test, medicine: medicine}] }
    Patient.findOneAndUpdate({ _id: req.body._id }, update, { new: true }, (err, doc) => {
        if (!err) { res.redirect('adminpage'); }
        else {
            if (err.name == 'ValidationError') {
                res.render("adminpage", {
                    pageTitle: 'Update Patient',
                    patient: req.body
                });
            }
            else
                console.log('Error during record update : ' + err);
        }
    });
}

exports.getPatientUpdate = (req,res,next) => {
    Patient.findById(req.params.id, (err, doc) => {
        if (!err) {
            res.render("adminpage", {
                viewTitle: "Update Patient",
                patient: doc
            });
        }
    });
}

exports.getDeletePatient = (req,res,next) => {
    Patient.findOneAndDelete(req.params.id, (err, doc) => {
        if (!err) {
            res.redirect('adminpage');
        }
        else { console.log('Error in patient delete :' + err); }
    });
}

