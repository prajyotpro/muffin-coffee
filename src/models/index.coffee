fs 	    = require 'fs'

models 	= {};

fs.readdirSync './dist/models/'
	.forEach (file) -> 
		if file.indexOf("index.js") < 0 
			model_name = file.slice 0, file.indexOf("-model.js")
			models[model_name] = require("./"+file)


module.exports = models
