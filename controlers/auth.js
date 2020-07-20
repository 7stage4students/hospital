const Doctor = require("../models/doctorSchema");
const bcrypt = require("bcrypt");
const Patient = require("../models/patientSchema");

//The Controller Bellow is for the admin login post request

exports.postAdminLogin = async (fields, res, next) => {
  let email, password;

  email = fields.email;
  password = fields.password;

  let user = await Doctor.findOne({ email: email });

  if (!user) return res.render("adminlogin", { message: "user not found" });

  let check = await bcrypt.compare(password, user.password);
  //TODO: get a password harsher
  let checkin = (password, userPassword) => {
    if (password === user.password) {
      return true;
    }
  };

  if (checkin(password, user.password))
    //  Redirect User to home page
    res.render("adminpage");
  else
    res.redirect("/adminlogin", {
      message: "incorrect email or password",
      messageClass: "alert-danger",
    });
};

//The Controller Bellow is for the user login post request
exports.postUserLogin = async (req, res, next) => {
  let email, password;
  email = req.body.email;
  password = req.body.password;

  let user = await Patient.findOne({ email: email });

  if (!user)
    // console.log('User no found')
    return res.redirect("/login");

  let check = await bcrypt.compare(password, user.password);

  if (check)
    // console.log('User is Logged In');
    res.redirect("/");
  // console.log('Sorry dude, you have to check your credentials again')
  else res.redirect("/login");
};
