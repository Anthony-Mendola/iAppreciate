class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/moments'
    else
      erb :'users/signup'
    end
  end
end
