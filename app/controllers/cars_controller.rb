class CarsController < ApplicationController

  #define car index action
  get '/cars' do
    #get all cars
    #create an instance variable to hold them
    @cars = Car.all
    # render the cars index view
    erb :"/cars/index"
  end
  
  get '/cars/new' do
    erb :"/cars/new"
  end

  # cars create action
  post '/cars' do 
   @cars = Car.new(params["car"])
    if @cars.save
      session[:user_id] = @cars.id 
      redirect to "/cars"
    else
      @errors = car.errors.full_message
      erb :"/cars/new"
    end
  end

  #cars show action via dynamic route variable
  get '/cars/:id' do
    @cars = Car.find_by(id: params[:id])
    erb :"/cars/show"
  end

  # cars get edit action
  get '/cars/:id/edit' do 
    @cars = Car.find_by_id(params[:id])
    if @user == current_user
    erb :"/cars/edit"
    else redirect to "/cars"
    end
  end

  #cars update action
  patch '/cars/:id' do 
    @cars = Car.find_by(id: params[:id])
    #@user = current_user
    if @user.id == current_user
      @cars.update
      redirect to "/cars"
    else
      erb :"/cars/index"
    end
  end

  # cars destroy action
  delete '/cars/:id' do
    #binding.pry
    @cars = Car.find_by_id(params[:id])
    if @user.id == @cars.id
    @cars.destroy
    redirect to "/cars"
    else
    erb :"cars/index"
    end
  end

end