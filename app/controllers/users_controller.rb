class UsersController < ApplicationController


  get '/signup' do
    if logged_in?
      redirect '/moments'
    else
    erb :'users/signup'
    end
  end

  post '/signup' do
		@user = User.new(:username => params[:username], :password => params[:password])
  	if params[:username] == ""
       flash[:error] = "Username must be filled in."
    elsif User.find_by(username: params[:username])
      flash[:error] = "Username is not available!"
    end
	    if @user.save
	      flash[:success] = "Your account was successfully created!"
	      session[:user_id] = @user.id
	      redirect '/home'
	    else
	      redirect '/signup'
	      flash[:error] = "Error creating account."
	  	end
	end

  get '/login' do
    if logged_in?
      redirect '/moments'
    else
      erb :'users/login'
    end
  end

#finds the correct user from the database and redirects them to their homepage.
  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome!"
      redirect '/home'
    else
      flash[:error] = "Wrong username or password."
      redirect '/login'
    end
  end

#responsible for logging out by clearing the session hash
  get '/logout' do
    if session[:user_id] != nil
      session.clear
      flash[:success] = "Signed out"
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
