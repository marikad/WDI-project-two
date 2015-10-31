class UserController < ApplicationController
	# GET /user
	# GET /users.json
	def index
	  @users = User.show.all
	end

	# GET /users/1
	# GET /users/1.json
	def show
	end
end