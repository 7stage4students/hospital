const crypto = require('crypto');
const getHashedPassword = (password) => {
    const sha256 = crypto.createHash('sha256');
    const hash = sha256.update(password).digest('base64');
    return hash;
};


const authToken = () =>{
    return crypto.randomBytes(16).toString('base64');
}
exports.getHashedPassword = getHashedPassword
exports.authToken = authToken