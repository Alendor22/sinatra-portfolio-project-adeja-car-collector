class UsersController < ApplicationController

  # user index action/route
  get '/users' do
    #get all users
    #create an instance variable to hold them
    @users = User.all
    # render the users index view
    erb :"/users/index"
  end

  # users signup action/route - working
  get '/signup' do
    erb :"users/new"
  end

  # users create action/route - working
  post '/users' do 
    #binding.pry
    @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id 
        redirect to "/users"
      else
        erb :"/users/new"
      end
  end

    #users show action/route via dynamic route variable - show one user
    get '/users/:id' do
      find_user
      erb :"/users/show"
    end

    # users get edit action/route
    get '/users/:id/edit' do 
      find_user 
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
      find_user
      if logged_in?
        #binding.pry
        user.update(params["user"])
        redirect to "/users/#{@user.id}"
      end
    end

    # users destroy action
    delete '/users/:id' do
      find_user
      if current_user.id != @car.owner_id
        redirect to "/users/index"
      else
        @user.cars.destroy
        session.clear
        redirect "/users"
      end
    end

end