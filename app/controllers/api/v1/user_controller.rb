class Api::V1::UserController < ApplicationController

	before_action :find_user, only: [:show, :update, :destroy]

	# get all users lists
	def index
		#params[:page]|| = 1
		@users = User.all.paginate(page: params[:page], per_page: 3)
		json_success_response(@users)
	end

	#adds new user to users table
	def create
		@user = User.new(users_params)
		if @user.save
			json_response(@user, "User is created Successfully.")
		else
			render json: {message: @user.errors.full_messages.join(" ")}, status: 400
		end		
	end

	def show
  	json_response(@user)
	end

	#updates specific user in users table
	def update
		if @user.update(users_params)
  		json_response(@user, "User Update Successfully.")
  	else
  		render json: {message: @user.errors.full_messages.join(" ")}, status: 400
  	end
	end


	def destroy
		if @user.destroy
			#json_response(@user, "User is deleted Successfully.")
			render json: {user: [], message: "User is deleted Successfully."}
		else
			#json_failed_response(@user)
			render json: {error: 'Unable to delete User.'}, status: 400
		end
	end

	def search
		results = User.search(params[:search])
		render json: results
	end

	private
	def users_params
    params.permit(:firstName, :lastName, :email)
  end

	def find_user
		@user = User.find(params[:id])
	end
end
