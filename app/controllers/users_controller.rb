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
      erb :"/users/edit"
      else
        redirect to "/"
      end
    end

    #users update action
    patch '/users/:id' do
      find_user
      if logged_in?
        @user.update(params["user"])
        redirect to "/users/#{@user.id}"
      end
    end

    # # users get favorite_cars route
    # get '/users/:id/favorite_cars' do
    #   @favorite = Favorite.find_by(id: params[:id])
    #   erb :"users/favorite_cars/new"
    # end

    # post '/users/:id/favorite_cars' do
    #   @favorite[car_id] = current_user.id
    #   @favorite = Favorite.new(params[:favorite])
    #   if @favorite.save
    #     redirect to "/users"
    #   else
    #     erb :"/users/favorite_cars/new"
    #   end
    # end


    # users destroy action
    delete '/users/:id' do
      find_user
      if current_user.id != @user.id
        redirect to "/users/index"
      else
        @user.destroy
        session.clear
        redirect "/users"
      end
    end

end