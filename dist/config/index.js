var Config, database, server_config;

database = require('./database');

server_config = require('./server');

Config = (function() {
  var environment;

  class Config {
    constructor() {}

  };

  
  // set environment as default if not set
  environment = process.env.NODE_ENV === void 0 ? 'default' : process.env.NODE_ENV;

  // server configuration
  Config.server = {
    port: server_config[environment].port,
    env: environment
  };

  // security
  Config.security = {
    salt: server_config[environment].salt,
    salt_rounds: server_config[environment].salt_rounds
  };

  // database configuration
  Config.database = {
    host: database[environment].host,
    database: database[environment].database,
    username: database[environment].username,
    password: database[environment].password,
    dialect: database[environment].dialect,
    logging: database[environment].logging
  };

  return Config;

}).call(this);

module.exports = Config;
