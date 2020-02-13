class UsersController < ApplicationController

  #define my index action
  get '/users' do
    #get all users
    #create an instance variable to hold them
    @users = User.all
    # render the users index view
    erb :"/users/index"
  end

  # users new action
  get '/signup' do
    erb :"users/new"
  end

  # users create action
  post 'signup' do 
    user = User.new(params["user"])
      if user.save
        session[:user_id] = user.id 
        redirect to "/users"
      else
        @errors = user.errors.full_message
        erb :"/users/new"
      end
    end

    



end