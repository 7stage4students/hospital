var crypto = require('crypto');
exports.genarate =  () => {
    return crypto.randomBytes(30).toString('hex');
}