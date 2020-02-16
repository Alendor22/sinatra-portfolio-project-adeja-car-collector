class CarsController < ApplicationController

  #define car index action
  get '/users/cars' do
    #get all cars
    #create an instance variable to hold them
    @car = Car.all
    # render the cars index view
    erb :"/users/cars/index"
  end

  # cars create action
  post '/users/cars' do 
    @car = Car.new(params["car"])
      if @car.save
        session[:car_id] = car.id 
        redirect to "/users/cars"
      else
        @errors = car.errors.full_message
        erb :"/users/cars/new"
      end
  end

  #cars show action via dynamic route variable
  get '/cars/:id' do
    @car = Car.find_by(id: params[:id])
    erb :"/users/cars/show"
  end

  # cars get edit action
  get '/users/cars/:id/edit' do 
    @car = Car.find_by_id(params[:id])
    erb :"/users/cars/edit"
  end

  #cars update action
  patch '/users/cars/:id' do 
    @car = User.find_by_id(params[:id])
    if @user.authenticate(params[:user][:password]) && @user.update(params   [:user])
      redirect to "/users/#{@car.id}"
    else
      erb :"/user/cars/show"
    end
  end

  # cars destroy action
  delete '/users/cars/:id' do
    @car = Car.find_by_id(params[:id])
    @car.destroy
    redirect to "/users/cars/index"
  end

end