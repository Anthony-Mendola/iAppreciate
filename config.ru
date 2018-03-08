require './config/environment' #loads the environment

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use EventsController
use MomentsController
use UsersController
run ApplicationController
#mounting our controller to tell Rack that part of my web app is defined within this class

#purpose of config.ru is to detail to Rack environment requirements to start the application.
