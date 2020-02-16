class CarsController < ApplicationController

  #define car index action
  get '/cars' do
    #get all cars
    #create an instance variable to hold them
    @cars = Car.all
    # render the cars index view
    erb :"/cars/index"
  end

  # cars create action
  post '/cars' do 
    @cars = Car.new(params["car"])
      if @cars.save
        session[:car_id] = car.id 
        redirect to "/cars"
      else
        @errors = car.errors.full_message
        erb :"/cars/new"
      end
  end

  #cars show action via dynamic route variable
  get '/cars/:id' do
    @cars = Car.find_by(id: params[:id])
    #binding.pry
    erb :"/cars/show"
  end

  # cars get edit action
  get '/cars/:id/edit' do 
    @cars = Car.find_by_id(params[:id])
    erb :"/cars/edit"
  end

  #cars update action
  patch '/cars/:id' do 
    @cars = User.find_by_id(params[:id])
    if @user.authenticate(params[:user][:password]) && @user.update(params[:user])
      redirect to "/cars/#{@car.id}"
    else
      erb :"/cars/show"
    end
  end

  # cars destroy action
  delete '/cars/:id' do
    @cars = Car.find_by_id(params[:id])
    @cars.destroy
    redirect to "/cars/index"
  end

end