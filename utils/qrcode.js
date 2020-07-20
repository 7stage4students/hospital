var qrcode = require('qrcode');
var fs = require('fs'); 
const path = require('path');
const qcode = (user) =>{
  

qrcode.toFile(path.join(__dirname,'../public/qrcodes',`${user.id}.png`), JSON.stringify(user))
console.log('qrcode has been saved');
console.log(path.join(__dirname,'../public/qrcodes',`${user.id}.png`),);
return `../qrcode/${user.id}.png`;
 
}


module.exports = qcode;