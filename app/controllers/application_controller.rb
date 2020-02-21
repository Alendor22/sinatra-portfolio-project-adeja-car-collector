require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "client"
  end

  get "/" do
    erb :"welcome"
  end

  helpers do 
    
    def current_user
      # returns the current_user object if there is one, otherwise nil
      # checks the session hash and finds a user based on the :user_id key
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def logged_in? 
        # returns true if logged_in, otherwise false
        !!current_user
    end

  end

end