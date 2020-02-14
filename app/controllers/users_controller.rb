class UsersController < ApplicationController

  #define user index action
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
  post '/users' do 
    user = User.new(params["user"])
      
      if user.save
        session[:user_id] = user.id 
        redirect to "/users"
      else
        @errors = user.errors.full_message
        erb :"/users/new"
      end
    end

    #users show action via dynamic route variable
    get '/users/:id' do
      @user = User.find_by(id: params[:id])
      erb :"/users/show"
    end

    # users edit action
    get '/users/:id/edit' do 
      @user = User.find_by_id(params[:id])
      erb :"/users/edit"
    end

    #users update action
    patch '/users/:id' do 
      @user = User.find_by_id(params[:id])
      #binding.pry
      if @user.authenticate(params[:user][:password]) && @user.update(params[:user])
        redirect to "/users/#{@user.id}"
      else
        erb :"/user/edit"
      end
    end

    # users destroy action
    delete '/user/:id' do 
      @user = User.find_by_id(params[:id])
      if @user
        @user.destroy
      end
      redirect to "/users"
    end

end