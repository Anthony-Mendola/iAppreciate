class MomentsController < ApplicationController


  get '/moments' do
    redirect_if_not_logged_in #helper method
    @user = current_user
    @events = @user.events
    erb :'moments/show' #renders the moments show page
  end

#presents the new moment form
  get '/moments/new' do
    redirect_if_not_logged_in
    @user = current_user
    @events = Event.all
    erb :'/moments/new'
  end

# creates a new moment
  post '/moments/new' do
    if params[:name] == ""
    erb :'/moments/new'
  else
    current_user.moments.create(:name => params[:name], :event_id => params[:event_id])
    redirect '/moments'
    end
  end

# presents a form for a new moment associated with an existing Event ID,
  get '/moments/new/:id' do
    redirect_if_not_logged_in
    @event = Event.find_by_id(params[:id])
    erb :'/moments/new_on_event'
  end

#creates a new moment associated with an existing Event ID.
  post '/moments/new/:id' do
    @event = Event.find_by_id(params[:id])
    Moment.create(:name => params[:name], :event_id => params[:id])
    redirect '/moments'
  end

#presents a form to edit a moment
  get '/moments/:id/edit' do
    @moment = Moment.find_by_id(params[:id])
    erb :'/moments/edit'
  end

#updates/edits our existing moment using the patch action
  patch '/moments/:id' do
    @moment = Moment.find_by_id(params[:id])
    @moment.name = params[:name]
    @moment.save
    redirect '/moments'
  end

#presents the delete prompt to ensure you want to delete a specific moment.
  get '/moments/:id/delete' do
    @moment = Moment.find_by_id(params[:id])
    erb :'/moments/delete'
  end

#deletes the moment
  delete '/moments/:id' do
    @moment = Moment.find_by_id(params[:id])
    @moment.destroy
    redirect '/moments'
  end

end
