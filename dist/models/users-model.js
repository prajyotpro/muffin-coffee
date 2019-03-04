var Users, db, definition;

db = require('../core/database');

// table definition
definition = {
  'name': {
    type: db.Sequelize.STRING
  }
};

Users = db.Connection.define('users', definition, {
  timestamps: true,
  createdAt: 'created_date',
  updatedAt: 'updated_date'
});

Users.getAll = function(req, callback) {
  
  // db.Connection.query "SELECT * FROM users", { type: db.Sequelize.QueryTypes.SELECT}
  // .then (users) -> 
  // 	console.log users
  // 	return callback null, users
  // .catch (error) -> 
  // 	return callback error, null
  return Users.findAll({}).then(function(users) {
    return callback(null, users);
  }).catch(function(error) {
    return callback(error, null);
  });
};

module.exports = Users;
