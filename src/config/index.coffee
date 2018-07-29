# database 	= require './database'
server_config 	= require './server'


module.exports = {

	server 	: {
		port: if server_config[process.env.NODE_ENV].port then server_config[process.env.NODE_ENV].port else server_config['default'].port,
		salt: if server_config[process.env.NODE_ENV].salt then server_config[process.env.NODE_ENV].salt else server_config['default'].salt
	}

}
