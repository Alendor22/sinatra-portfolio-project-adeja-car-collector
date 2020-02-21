class UsersController < ApplicationController

  #define user index action
  get '/users' do
    #get all users
    #create an instance variable to hold them
    @users = User.all
    # render the users index view
    erb :"/users/index"
  end

  # users new action - working
  get '/signup' do
    erb :"users/new"
  end

  # users create action - working
  post '/users' do 
    
    @user = User.new(params["user"])
      if @user.save
        session[:user_id] = @user.id 
        redirect to "/users"
      else
        erb :"/users/new"
      end
  end

    #users show action via dynamic route variable
    get '/users/:id' do
      @user = User.find_by(id: params[:id])
      erb :"/users/show"
    end

    # users get edit action
    get '/users/:id/edit' do 
      @user = User.find_by(id: params[:id])
      
      if current_user.id == @user.id 
        # show the form
        #binding.pry
      erb :"/users/edit"
      else
        redirect to "/"
      end
    end

    #users update action
    patch '/users/:id' do
      @user = User.find_by_id(params[:id])
      if logged_in?
        #binding.pry
        @user.update#(:location current_user.location, :favorite_car current_user.favorites)
        #map { |car| car.year }, current_user.favorite_cars.map { |car| car.make }, current_user.favorite_cars.map { |car| car.model })
        redirect to "/users/#{@user.id}"
      end
    end

    # users destroy action
    delete '/users/:id' do
      @user = User.find_by_id(params[:id])
      if current_user.id != @user.id
        redirect to "/users/index"
      else
        @user.destroy
        session.clear
        redirect "/users"
      end
    end

end