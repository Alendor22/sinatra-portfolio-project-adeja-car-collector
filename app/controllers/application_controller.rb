require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "client"
  end

  get "/" do
    erb :welcome
  end

  def loged_in? 
    #returns true if logged_in, otherwise false
    !!current_user
  end

  def current_user
    #returns the current_user object if there is one, otherwise nil
    User.find_by(id: session[:user_id])
  end

end
