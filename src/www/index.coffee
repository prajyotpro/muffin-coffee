cluster = require 'cluster'
http    = require 'http'
cpus 	= require('os').cpus()
app 	= require('express')()
server  = require('http').createServer(app)

config 	= require '../config/'

helmet 	= require 'helmet'


if cluster.isMaster 

	console.log "Master process is running on #{process.env.NODE_ENV} environment" 
	console.log config

	for cpu in cpus 
		cluster.fork()

	cluster.on 'exit', (worker, code, signer) -> 

		console.log "Worker #{worker.id} died" 

		forked = cluster.fork()
		console.log "Re-spawning worker #{process.pid} " 

else 

	app.use helmet()

	router 	= require('../routes/')(app)


	app.listen config.server.port, () -> 
		console.log("Worker running #{process.pid}, listening to port #{config.server.port}")

