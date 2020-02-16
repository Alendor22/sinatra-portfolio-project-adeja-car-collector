require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use CarsController
use UserCarsController
use Rack::MethodOverride
use SessionController
use UsersController
run ApplicationController

