
const router = require('express').Router();
const jsonFile = require('jsonfile');
const path = require('path');
let  onlineUsers = {};
let user= {}

// jsonFile.writeFileSync(path.join(__dirname,'../','users.json'),onlineUsers);
console.log('Created the online users files')

router.use( (req,res,next) =>{  

  console.log('requesting' + req.url)
  let token = req.cookies['token']

  if(token){
    onlineUsers = jsonFile.readFileSync(path.join(__dirname,'../','users.json'));
    user = onlineUsers[token];
    req.user = user;
  }
  
next();
})

module.exports = router;