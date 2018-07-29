express	= require('express')
router 	= express.Router() 

router.get '/', (req, res) -> 
	res.send "Welcome home"
	return


module.exports = router