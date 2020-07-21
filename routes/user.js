const express = require("express");
const auth = require("../controlers/user");
const formidable = require("formidable");

const form = formidable({ multiples: true });
const router = express.Router();

router.get("/login", (req, res) => {
  res.render('login')
});
router.post("/login", (req, res) => {

  form.parse(req, (err, fields, files) => {
    if (err) {
      next(err);
      return;
    } else {
      console.log("User Login");
      auth.userLogin(fields, res);
    }
  });
});

router.get("/register", (req, res) => {
  res.render("registration");
});

router.post("/register", (req, res) => {
  console.log(req.body);

  form.parse(req, (err, fields, files) => {
    if (err) {
      next(err);
      return;
    } else {
      console.log("User Login");
      console.log(fields)
      if (fields.password == fields.confirmPassword) {
        console.log(fields);
        if (files.upload.size){
             console.log(files.upload)
             console.log(files);
             fields.profilePath = files.upload.path;
             fields.profileName = files.upload.name;
             fields.profileType = files.upload.type;
        } 
        console.log(fields)
        auth.register(fields, res);
      } else {
        res.render("registration");
      }
    }
  });
});

router.get("/profile", (req, res) => {
  if (req.user) {
    console.log(req.user);
    res.send("display the users page");
  } else res.render("login");
});

module.exports = router;
