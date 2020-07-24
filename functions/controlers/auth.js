const Doctor = require("../models/doctorSchema");
const bcrypt = require("bcrypt");
const Patient = require("../models/patientSchema");
let jsonFile = require("jsonfile");
const path = require("path");
const users = require('./admin');
const { authToken } = require("./getHashedPassword");
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

  if (checkin(password, user.password)){
    //  Redirect User to home page
      console.log(user);

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
      let info = users.getAll();

      info.then((val)=>{
        console.log('edfdgal',new Object(val));
        res.render("admin/profile", {val:JSON.parse(val)});
      })
     
    }
  else
    res.redirect("/adminlogin");
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