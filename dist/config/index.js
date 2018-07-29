// database 	= require './database'
var server_config;

server_config = require('./server');

module.exports = {
  server: {
    port: server_config[process.env.NODE_ENV].port ? server_config[process.env.NODE_ENV].port : server_config['default'].port,
    salt: server_config[process.env.NODE_ENV].salt ? server_config[process.env.NODE_ENV].salt : server_config['default'].salt
  }
};
