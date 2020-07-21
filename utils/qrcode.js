var qrcode = require('qrcode');
var fs = require('fs'); 
const path = require('path');

const qCode = async(user) =>{
    console.log(user)
    await qrcode.toFile(path.join(__dirname,'../','public','qrcode',`${user.email}.png`), user.id)
    console.log('qrcode has been saved');

    return `../aqwerty40rcode/${user.id}.png`;
    
}

module.exports = qCode;