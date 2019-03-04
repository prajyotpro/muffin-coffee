Controller 	= require '../core/controller'
Models 		= require '../models/'


class Home extends Controller

	welcome:(req, res)=> 

		console.log Models
		Models.users.getAll req, (error, users) -> 
			console.log error
			console.log users

		res.send super.welcome()+" home welcome"


home = new Home
module.exports = home