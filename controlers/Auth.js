
  //The Controller Bellow is for the admin login
exports.getAdminLogin = (req, res, next) => {
    res.render('auth/login', {
      path: '/login',
      pageTitle: 'Admin Login',
    });
  };
  
  
  //The Controller Bellow is for the Patient Login
  exports.getUserLogin = (req, res, next) => {
    res.render('auth/login', {
      path: '/login',
      pageTitle: 'User Login',
    });
  };

  //The Controller Bellow is for the admin login post request

exports.postAdminLogin = (req, res, next) => {
    const email = req.body.email;
    const password = req.body.password;
    User.findOne({ email: email })
      .then(user => {
        if (!user) {
          return res.redirect('/login');
        }
        bcrypt
          .compare(password, user.password)
          .then(doMatch => {
            if (doMatch) {
                //Redirect User to home page
                res.redirect('/adminpage');
            }
            res.redirect('/login');
          })
          .catch(err => {
            console.log(err);
            res.redirect('/login');
          });
      })
      .catch(err => console.log(err));
  };


  //The Controller Bellow is for the user login post request
  exports.postUserLogin = (req, res, next) => {
    const email = req.body.email;
    const password = req.body.password;
    User.findOne({ email: email })
      .then(user => {
        if (!user) {
          return res.redirect('/login');
        }
        bcrypt
          .compare(password, user.password)
          .then(doMatch => {
            if (doMatch) {
                res.redirect('/');
            }
            res.redirect('/login');
          })
          .catch(err => {
            console.log(err);
            res.redirect('/login');
          });
      })
      .catch(err => console.log(err));
  };
  
  exports.postLogout = (req, res, next) => {
      res.redirect('/');
  };
  