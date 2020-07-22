const router = require('express').Router()

router.get('/hello',(req,res)=>{
    res.send('routing works');
})

module.exports = router;