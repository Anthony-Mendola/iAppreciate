class EventsController < ApplicationController

    get '/events/new' do
      redirect_if_not_logged_in
      erb :'/events/new'
    end

    post '/events/new' do
      @user = current_user
      event = @user.events.create(:name => params[:name])
      moment = event.moments.create(:name => params[:moments][:name])
      redirect '/moments'
    end

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
