express	= require('express')
router 	= express.Router() 

Home 	= require '../controllers/home-controller'


router.get '/', (req, res) -> 
	Home.welcome req, res


module.exports = router
