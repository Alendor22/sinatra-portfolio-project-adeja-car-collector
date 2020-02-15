class SessionController < ApplicationController

  # The routes that live here are:
  # login & logout

  # LOGIN:

  # renders the login form
  get '/login' do 
    erb :"/sessions/new"
  end

  # receives the login form once submitted
  post '/login' do
    
    user = User.find_by(username: params[:user][:username]) # find/validate the user using the username
    
    if user && user.authenticate(params[:user][:password]) # find the user AND the user is authenticated
      session[:user_id] = user.id # act of logging someone in!
      redirect to "/users/#{user.id}"
    else
      redirect to '/login'
    end
  end

  post '/logout' do 
    session.clear
    redirect to '/'
  end

end