class UsersController < ApplicationController

	before_action :find_user, except: [:new, :create]

	def new
		@user = User.new
	end

	def create

		#@user = User.new( username: params[:username], 
						  #email: params[:email], 
						  #password: params[:password] )
		
		@user = User.new(user_params)

		if @user.save
			flash.notice = "User '#{@user.username}' Created!"
			redirect_to new_user_path
		else
			render 'new'
		end

	end

	def edit
		# Uses the find_user before_action here
	end

	def update
		# Uses the find_user before_action here
		if @user.update(user_params)
			flash.notice = "User '#{@user.username}' Updated!"
			redirect_to edit_user_path(@user)
		else
			render 'edit'
		end
	end

	private

		def find_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end