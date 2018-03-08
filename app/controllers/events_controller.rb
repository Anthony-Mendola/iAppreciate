class EventsController < ApplicationController

#presents new event form
    get '/events' do
      redirect_if_not_logged_in #helper method
      erb :'/events/new'  #renders form for a new event
    end

    #creates a new event
    post '/events/new' do
      @user = current_user
      event = @user.events.create(:name => params[:name])
      moment = event.moments.create(:name => params[:moments][:name])
      redirect '/moments'         #creates a new event then redirects to the moments page
    end

    #Dynamic routes example:
    #The HTTP request verb, GET matches the get method in our controller.  The /events/1/edit path in the
    #HTTP request matches our path in this controller method. The 1 is an id parameter that's being passed
    #into the path, matching the controllers expectation for an id parameter to be passed in place of :id

#presents a form to edit an event
    get '/events/:id/edit' do
      redirect_if_not_logged_in
      @event = Event.find_by_id(params[:id])
      erb :'events/edit'
    end

#updates/edits our existing event using the patch action
    patch '/events/:id' do
      @event = Event.find_by_id(params[:id])
      @event.name = params[:name]
      @event.save
      redirect '/moments'
    end

#presents the delete prompt to ensure you want to delete a specific event
    get '/events/:id/delete' do
      @event = Event.find_by_id(params[:id])
      erb :'events/delete'
    end

#deletes the event
    delete '/events/:id' do
      @event = Event.find_by_id(params[:id])
      @event.destroy
      redirect '/moments'
    end

end
