var Sequelize, config, connection;

config = require('../config/');

Sequelize = require('sequelize');

connection = new Sequelize(config.database);

module.exports = {
  Connection: connection,
  Sequelize: Sequelize
};
