class CarsController < ApplicationController

  #define car index action
  get '/cars' do
    #get all cars
    #create an instance variable to hold them
    @car = Car.all
    # render the cars index view
    erb :"/cars/index"
  end
  
  get '/cars/new' do
    erb :"/cars/new"
  end

  # car create action - 
  post '/cars' do 
    # ensure that someone is logged in - done
    # ensure that the current user is assoc. with the car
    if !logged_in?
      redirect to '/login'  
    else
      @car = Car.new(params["car"])
      car_owner
      @car.save 
    end
    redirect to "/cars"
  end

  #car show action via dynamic route variable
  get '/cars/:id' do
    find_car
    #binding.pry
    erb :"/cars/show"
  end

  # car get edit action
  get '/cars/:id/edit' do 
    find_car
    if car_owner
    erb :"/cars/edit"
    else redirect to "/cars"
    end
  end

  #car update action
  patch '/cars/:id' do 
    find_car
    if car_owner
      @car.update(params["car"])
    end
      redirect to "/cars"
  end

  # car destroy action - working 
  delete '/cars/:id' do
    find_car
    if car_owner
    @car.destroy
    end
    redirect to "/cars"
  end

end