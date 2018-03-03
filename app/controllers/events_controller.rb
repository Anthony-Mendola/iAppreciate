class EventsController < ApplicationController

    get '/events' do
      redirect_if_not_logged_in
      erb :'/events/new'
    end

    post '/events/new' do
      @user = current_user
      event = @user.events.create(:name => params[:name])
      moment = event.moments.create(:name => params[:moments][:name])
      redirect '/moments'
    end

    #Dynamic routes example:
    #The HTTP request verb, GET matches the get method in our controller.  The /events/1/edit path in the
    #HTTP request matches our path in this controller method. The 1 is an id parameter that's being passed
    #into the path, matching the controllers expectation for an id parameter to be passed in place of :id

    get '/events/:id/edit' do
      redirect_if_not_logged_in
      @event = Event.find_by_id(params[:id])
      erb :'events/edit'
    end

    patch '/events/:id' do
      @event = Event.find_by_id(params[:id])
      @event.name = params[:name]
      @event.save
      redirect '/moments'
    end

    get '/events/:id/delete' do
      @event = Event.find_by_id(params[:id])
      erb :'events/delete'
    end

    delete '/events/:id' do
      @event = Event.find_by_id(params[:id])
      @event.destroy
      redirect '/moments'
    end

end
