jwt		= require 'jwt-simple'
bcrypt 	= require 'bcrypt'

config 	= require '../config/' 


class Security
	constructor : () -> 
	
	###
    Function to generate password from given text 
    @param password_text String 
    @return callback function with generated password 
    ###
	generatePassword: (password_text, callback) -> 
		bcrypt.hash password_text, config.security.salt_rounds, (err, hash) -> 
			if err then return callback err, null
			return callback null, hash
	
	###
    Function to generate token from user info object text 
    @param user_info Object user information 
    @return callback function with generated token 
    ###
	generateToken: (user_info, callback) -> 
		now 	= new Date()
		token 	= jwt.encode user_info._id+'_'+now, config.security.salt 
		return callback null, token 
	
	###
    Function to compare 2 given password strings 
    @param coparision_object {hash: saved password, password: user input}
    @return callback function with comparision result
    ###
	comparePassword: (comparision_object, callback) -> 
		if typeof comparision_object != 'object'
			return callback "Invalid password", null

		if comparision_object.password == undefined or comparision_object.hash == undefined 
			return callback "Invalid password", null

		bcrypt.compare comparision_object.password, comparision_object.hash, (err, res) -> 
			if err
				return callback "Invalid login.", null

			if res != true
				return callback "Invalid login.", null

			return callback null, comparision_object

	@getToken = (headers) -> 
		if headers && headers.authorization 
			parted = headers.authorization.split(' ');
	
			if parted.length != 2 then return null 
	
			if  parted[0] != 'Bearer' then return null 
				
			return parted[1]
			
		else 
			return null 
	
	
	@getUserIdFromDecodedToken = (decoded_token) -> 
		parted = decoded_token.split('_')
		return parted[0]


module.exports 	= Security
