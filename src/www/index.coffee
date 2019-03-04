cluster = require 'cluster'
http    = require 'http'
cpus 	= require('os').cpus()
app 	= require('express')()
server  = require('http').createServer(app)

config 	= require '../config/'
db 		= require '../core/database'

helmet 	= require 'helmet'


if cluster.isMaster 

	console.log "Master process is running on #{process.env.NODE_ENV} environment" 

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
		db.Connection.sync() 
			.then () -> 
				console.log "... database synced!"
				console.log("Worker running #{process.pid}, listening to port #{config.server.port}")
			.catch (err) -> 
				throw err
		

