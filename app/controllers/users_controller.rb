class UsersController < ApplicationController

  get '/users' do
		@users = User.all
	end


  get '/signup' do
    if logged_in?
      redirect '/moments'
    else
    erb :'users/signup'
    end
  end

  post '/signup' do
    #@user shouldn't be an instance variable - change it
		@user = User.new(:username => params[:username], :password => params[:password])
	    redirect '/signup' if params[:username].empty?
	    if @user.save
	      flash[:success] = "Account created."
	      session[:user_id] = @user.id
	      redirect '/'
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
