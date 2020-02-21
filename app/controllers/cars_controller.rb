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
      current_user.id = @car.owner_id
      @car.save 
    end
    redirect to "/cars"
  end

  #car show action via dynamic route variable
  get '/cars/:id' do
    @car = Car.find_by(id: params[:id])
    binding.pry
    erb :"/cars/show"
  end

  # car get edit action
  get '/cars/:id/edit' do 
    @car = Car.find_by_id(params[:id])
    if @car.owner = current_user.id
    erb :"/cars/edit"
    else redirect to "/cars"
    end
  end

  #car update action
  patch '/cars/:id' do 
    @car = Car.find_by(id: params[:id])
    if current_user.id == @car.owner_id
      @car.update(params["car"])
    end
    redirect to "/cars"
  end

  # car destroy action - working 
  delete '/cars/:id' do
    @car = Car.find_by_id(params[:id])
    if current_user.id == @car.owner_id
    
    @car.destroy(params["car"])
    end
    redirect to "/cars"
  end

  # get '/cars/:car_id/owners' do
  #   @car = Car.find_by(id: params[:id])
  #   car_owner?
  #   erb :"/cars/owners"
  # end

end