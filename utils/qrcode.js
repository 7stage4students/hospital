var qrcode = require('qrcode');
var fs = require('fs'); 
const path = require('path');

const qCode = async(user) =>{
    console.log(user)
    await qrcode.toFile(path.join(__dirname,'../','public','qrcode',`${user.email}.png`), user.id)
    console.log('qrcode has been saved');

<<<<<<< HEAD
await qrcode.toFile(path.join(__dirname,'../','public','qrcode',`${user.email}.png`), user.id)
console.log('qrcode has been saved');

return `../qrcode/${user.id}.png`;
 
=======
    return `../aqwerty40rcode/${user.id}.png`;
    
>>>>>>> ec3d4ed40653dd329c711b8acc99db517373559f
}

module.exports = qCode;