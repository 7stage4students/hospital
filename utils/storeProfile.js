const { pipeline } = require('stream');

const storeProfilePic=(data) =>{
    const fs = require('fs')
    const path = require('path');

    let readStream = fs.createReadStream(data.path)
    let writeStream = fs.createWriteStream(path.join(__dirname,'../','public','profilePic',`${data.name}`));

    readStream.pipe(writeStream)
    
}

module.exports = storeProfilePic;