const mongoose = require('mongoose');

const logData = new mongoose.Schema({
    date:{
        type: String,
        default: new Date()
    },
    test: [String],
    medicine: [String]
});


const patientSchema = new mongoose.Schema({
    name:{
        type: String,
        required: true,
        min: 6,
        max: 255
    },
    age:{
        type: Number,
        required: true,
    },
    dob: String,
    email:{
        type: String,
        required: true,
        max: 255,
        min: 6
    },
    password:{
        type:String,
        required: true,
        max: 1024,
        min: 6
    },  
    bloodType: {
        type: String,
        
    },  
    disease :[String],
    location : String,
    image_url: String,
    qrcode_url: String,
    logs : [logData],
    date:{
        type: String,
        default: new Date()
    }
})

module.exports =  mongoose.model('patient',patientSchema);

