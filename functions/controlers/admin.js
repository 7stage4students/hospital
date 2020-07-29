const Patient = require('../models/patientSchema');

//GeT All Patients
exports.
getAll = async(res)=>{
 
    Patient.find({},(err,result)=>{
        if(err) throw err
        console.log(result)
        res.send(result)
    })
    
    
}

//Get By ID
exports.
getById = async(id,res) =>{
    Patient.find({_id: id},(err,result)=>{
        if(err) throw err
        res.send(result)
    })
}



//GET REQUEST TO ADMIN GET PATIENT
// exports.getAddPatient = (req, res, next) => {
//   res.render('adminpage', {
//     pageTitle: 'Add Patient',
//     editing: false
//   });
// };

//ADMIN ADD PATIENT
// exports.postAddPatient = (req, res, next) => {
// const name = req.body.name;
// const email = req.body.email;
// const age = req.body.age;
// const password = getHashedPassword(req.body.password)
// const diseases = req.body.diseases.split(',');
// const test = Array.from(req.body.test)

// const medicine = req.body.medicine.split(',');

// const patient = new Patient({
//     name: name,
//     email: email,
//     age: age,
//     password: password,
//     diseases: diseases,
//     logs: [{test: test, medicine: medicine}]
//   });

//   patient
//     .save()
//     .then(result => {
//       // console.log(result);
//       console.log('Created Patient');
//       res.redirect('adminpage');
//     })
//     .catch(err => {
//       console.log(err);
//     });
// };

//ADMIN UPDATE PATIENT DETAILS
// module.exports.postUpdate = (req,res) => {
//     const name = req.body.name;
//     const email = req.body.email;
//     const age = req.body.age;
//     const password = getHashedPassword(req.body.password)
//     const diseases = req.body.diseases.split(',');
//     const test = Array.from(req.body.test)
//     const medicine = req.body.medicine.split(',');
//     const update = {name: name,email: email,password: password,disease: diseases,logs: [{test: test, medicine: medicine}] }
//     Patient.findOneAndUpdate({ _id: req.body._id }, update, { new: true }, (err, doc) => {
//         if (!err) { res.redirect('adminpage'); }
//         else {
//             if (err.name == 'ValidationError') {
//                 res.render("adminpage", {
//                     pageTitle: 'Update Patient',
//                     patient: req.body
//                 });
//             }
//             else
//                 console.log('Error during record update : ' + err);
//         }
//     });
// }

// exports.getPatientUpdate = (req,res,next) => {
//     Patient.findById(req.params.id, (err, doc) => {
//         if (!err) {
//             res.render("adminpage", {
//                 viewTitle: "Update Patient",
//                 patient: doc
//             });
//         }
//     });
// }

// exports.getDeletePatient = (req,res,next) => {
//     Patient.findOneAndDelete(req.params.id, (err, doc) => {
//         if (!err) {
//             res.redirect('adminpage');
//         }
//         else { console.log('Error in patient delete :' + err); }
//     });
// }

