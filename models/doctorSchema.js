const mongoose = require('mongoose');
// const item = new mongoose.Schema(String);

const doctorSchema = new mongoose.Schema({
    name:{
        type:String,
        required: true,
    },
    age:{
        type: Number,
        required: true
    },
    email: {
        type: String,
        required: true,
    },
    password: {
        required: true,
        type:String,
        min: 5,
    },
    speciality: [String],
    hospital: String

})
module.exports =  mongoose.model('doctor',doctorSchema);

