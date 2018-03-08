require './config/environment'

class ApplicationController < Sinatra::Base #inherits Sinatra class functionality.

  configure do   #configure is part of built-in setting that control whether features are enabled or not
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #turns sessions on
    set :session_secret, "L1vE-L0nG-&-Pr0$PeR"  #encryption key used to create a session_id
    register Sinatra::Flash
  end

#A view can only access instance variables.
#routes connect HTTP requests to a specific method.
    get "/" do
      if logged_in? #if you're logged in and try to go to the index page, it redirects you to home
        redirect '/home'
      end
      erb :index
    end

    get '/home' do
    if !logged_in? #if not logged in, then redirect to login page.
      redirect '/login'
    end
    erb :'home'
    end

# Helper methods are methods that are written in the controller, are accessible
#in the views, and provide some logical support.
    helpers do
      def redirect_if_not_logged_in
        if !logged_in?
          flash[:error] = "You need to be logged in to do that."
          redirect '/login'
        end
      end

      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find(session[:user_id])  
      end
    end

  end

#Controllers handle the HTTP requests of URL paths,
#as well as patching and deleting data from the server.
#The waiter/waitress.
