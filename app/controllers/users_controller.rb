class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update, :destroy]

	# GET /user
	# GET /users.json
	def index
	  @users = User.all
	end

	# GET /users/1
	# GET /users/1.json
	def show
		@user = User.find(params[:id])
	end
end

def edit
end