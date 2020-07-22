const Patient = require("../models/patientSchema");
const { getHashedPassword } = require("./getHashedPassword");
const { authToken } = require("./getHashedPassword");
let jsonFile = require("jsonfile");
const qCode = require('../utils/qrcode');
const path = require("path");
const storeProfilePic = require('../utils/storeProfile');
const express = require('express');
const app = express()
//The Controller Bellow is for the admin login post request
let currentUser = {}
exports
  .userLogin = async (fields, res, next) => {
    let email, password;
    console.log("User Credentials");
    console.log(fields);
    email = fields.email;
    password = fields.password;

    let user = await Patient.findOne({
      email: email,
      password: getHashedPassword(password),
    });

    console.log(user);

    if (user) {
      let token = authToken();
      res.cookie("token", token, {
        maxAge: 6000000,
      });

      let data = jsonFile.readFileSync(path.join(__dirname, "../", "users.json"));

      data[token] = {
        email: user.email,
        password: user.password,
      };

      jsonFile.writeFileSync(path.join(__dirname, "../", "users.json"), data);
      console.log('user is', user);
      currentUser = user;
      user.pro = 'active'
      app.locals.user = user;
    
      res.render("user/profile", user);
    } else
      res.render("login", {
        message: "user not found",
        messageClass: "alert-danger",
      });
  };

  exports.logs = ()=>{
    return currentUser;
  }
// Registering new Patients
exports
  .register = async (fields, res, next) => {
    const name = fields.name;
    const email = fields.email;
    const age = fields.age;
    const password = getHashedPassword(fields.password);
    let diseases, test, medicine;
    if (fields.disease) {
      diseases = fields.diseases.split(",");
      test = Array.from(fields.test);
      medicine = fields.medicine.split(",");
    }

    let check = await Patient.findOne({ email: email });
    console.log(check);

    if (!!check) {
      res.render("register", { message: "Account already In Use" });
      console.log("User Already Exises");
    } else {
      const patient = new Patient({
        name: name,
        email: email,
        age: age,
        password: password,
        diseases: diseases,
        image_url: `profilePic/${fields.profileName}`,
        qrcode_url: `qrcode/${email}.png`,
        logs: [{ test: [test], medicine: [medicine] }],
      });

      try {
        patient.save();
        const id = patient._id;
        qCode({ email, id: `${id}` })
        if (fields.profileName)
          storeProfilePic({ name: fields.profileName, path: fields.profilePath, type: fields.profileType })
        res.render("login");

      } catch (err) {
        console.log("An error occured in Svaing he data");
        res.render("registration");
      }
    }
  };
