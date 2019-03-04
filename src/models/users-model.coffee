db      = require '../core/database'

# table definition
definition = 
	'name'	: 
		type: db.Sequelize.STRING


Users	= db.Connection.define 'users', definition, 
			{
				timestamps: true,
				createdAt : 'created_date',
				updatedAt : 'updated_date'
			}


Users.getAll = (req, callback) -> 
	# db.Connection.query "SELECT * FROM users", { type: db.Sequelize.QueryTypes.SELECT}
	# .then (users) -> 
	# 	console.log users
	# 	return callback null, users
	# .catch (error) -> 
	# 	return callback error, null
	Users.findAll {}
	.then (users) -> 
		return callback null, users
	.catch (error) -> 
		return callback error, null


module.exports = Users
