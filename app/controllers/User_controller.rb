class UsersController < ApplicationController

  #define my index action
  get '/users' do
    #get all users
    #create an instance variable to hold them
    @users = User.all
    # render the users index view
    erb :"/users/index"
  end