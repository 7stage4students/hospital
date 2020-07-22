var qrcode = require('qrcode');
var fs = require('fs'); 
const path = require('path');

const qCode = async(user) =>{

await qrcode.toFile(path.join(__dirname,'../','public','qrcode',`${user.email}.png`), user.password)
console.log('qrcode has been saved');

return `../qrcode/${user.id}.png`;
 
}

module.exports = qCode;
