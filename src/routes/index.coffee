fs 	= require 'fs'

module.exports = (app) -> 

	app.get "/", (req, res) -> 
		res.send "Hello world, welcome to muffin-coffee"

	fs.readdir './dist/routes/', (err, files) -> 
		files.forEach (file) -> 
			if file.indexOf("index.js") < 0 
				route_name = file.slice 0, file.indexOf("-router.js")
				app.use "/"+route_name.toString()+"/", require("./"+file)
			