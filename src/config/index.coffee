database 		= require './database'
server_config 	= require './server'


class Config 

	constructor: () -> 

	# set environment as default if not set
	environment = if process.env.NODE_ENV is undefined then 'default' else process.env.NODE_ENV

	# server configuration
	@server	: 
		port		: server_config[environment].port
		env 		: environment

	# security
	@security: 
		salt		: server_config[environment].salt,
		salt_rounds : server_config[environment].salt_rounds,

	# database configuration
	@database: 
		host    	: database[environment].host
		database	: database[environment].database
		username	: database[environment].username
		password	: database[environment].password
		dialect 	: database[environment].dialect 
		logging 	: database[environment].logging


module.exports = Config
