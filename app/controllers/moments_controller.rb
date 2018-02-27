class MomentsController < ApplicationController

  get '/moments' do
    redirect_if_not_logged_in
    @user = current_user
    @events = @user.events
    erb :'moments/show'
  end

# Makes a new moment
  get '/moments/new' do
    redirect_if_not_logged_in
    @user = current_user
    @events = Event.all
    erb :'/moments/new'
  end

  post '/moments/new' do
    Moment.create(:name => params[:name], :list_id => params[:list_id])
    redirect '/moments'
    end

# Builds a new moment associated with the Event ID
  get '/moments/new/:id' do
    redirect_if_not_logged_in
    @event = Event.find_by_id(params[:id])
    erb :'/moments/new_on_event'
  end

  post '/moments/new/:id' do
    @event = Event.find_by_id(params[:id])
    Moment.create(:name => params[:name], :list_id => params[:id])
    redirect '/moments'
  end

# moment editing
  get '/moments/:id/edit' do
    @moment = Moment.find_by_id(params[:id])
    erb :'/moments/edit'
  end

  patch '/moments/:id' do
    @moment = Moment.find_by_id(params[:id])
    @moment.name = params[:name]
    @moment.save
    redirect '/moments'
  end

# moment deletion
  get '/moments/:id/delete' do
    @moment = Moment.find_by_id(params[:id])
    erb :'/moments/delete'
  end

  delete '/moments/:id' do
    @moment = Moment.find_by_id(params[:id])
    @Moment.destroy
    redirect '/moments'
  end

end
