# The Odin Project: Bare Forms and Helper Methods

This is the Forms Project from the Odin Project's Ruby on Rails Curriculum.

## Objective

These projects will give you a chance to actually build some forms, both using nearly-pure HTML and then graduating to using the helper methods that Rails provides.

## Walkthrough

## Step One

### Create and migrate a User model

- rails generate model User username:string email:string password:string
- bundle exec rake db:migrate

### In app/models/user.rb add validations for presence:

- validates :username, presence: true
- validates :email,	   presence: true
- validates :password, presence: true

### Create the :users resource in your routes

- resources :users, only: [:new, :create]

### Build a new UsersController with empty new and create methods

    class UsersController < ApplicationController
		def new
		end
		def create
		end
    end

### In app/views/users/

- create the view called new.html.erb

### Make sure everything works

- http://localhost:3000/users/new

## Step 2: 

### Build HTML Form

    Paste The Form Here

### Try to submit data

- ActionController::InvalidAuthenticityToken

### Add the authenticity token helper:

- <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

###  Try to submit the data, and you will get ...

- template is missing error

### In app/controllers/users_controller.rb build the create action

	def create
		@user = User.new( username: params[:username],
						  email: 	params[:email],
						  password: params[:password] )
		if @user.save
			redirect_to new_user_path
		else
			render 'new'
		end
	end

### Create and implement a user_params helper method

    def user_params
		params.require(:user).permit(:username, :email, :password)
	end

### Update the form to submit hash of user parameters:

- change name="username"
- to     name="user[username]"

- Also do this for the email and password

### Update the create action

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to new_user_path
		else
			render 'new'
		end
	end

## Step 3: 

### Building the Form using the form_tag

    Paste The Form Here

### In app/controllers/user_controller.rb

- modify the create method to once again accept normal top level User attributes.

- @user = User.new( username: params[:username], 
				    email: params[:email], 
				    password: params[:password] )

## Step 4: 

### Building the form using form_for

### Modify the new action in the controller to instantiate a blank User object

    def new
		@user = User.new
    end

### Comment out the last form that used the form_tag

    Paste The form_for Here

### In app/controllers/user_controller.rb

- Change your controller's create method to accept the nested :user hash from params.

- @user = User.new(user_params)

### Confirm you can submit data using the form_for form

- http://localhost:3000/users/new

## Step 5

### Editing Users

### Update your routes to handle the editing

- resources :users, only: [:new, :create, :edit, :update]

### Update the controller to handle editing an existing user.

- In app/controllers/users_controller.rb
- before_action :find_user, except: [:new, :create]

### define the find_user

def find_user
	@user = User.find(params[:id])
end

### In app/views/users/edit.html.erb

- Copy/paste your form from the New view to Edit form:

## Step 6: Extra Credit

    <ul>
    	<% @user.errors.full_messages.each do |msg| %>
    		<li><%= msg %></li>
    	<% end %>
    </ul>