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
    #return true if logged_in, otherwise false
    !!current_user
  end

  def current_user
    #return the current_user object if there is on, otherwise nil
    User.find_by(id: session[:user_id])
  end

end
