# Sinatra-Portfolio-Project-Adeja-Car-Collector

- Overview

The intended use of the car collector app is to create cars, view a list of cars and there details/attributes.  A user can sign up as a new user then begin to create a new car, once a car is created it will become part of the users collection and will be able to be viewed as such, if a user creates another car it will be listed as one of the users cars and added to their collection as well.  A user can view other users' cars in their collection as well by clicking that cars link, but he\she will not be given access to edit\delete the cars of other users.  A user can only edit\delete cars he\she has created by clicking the link of the car created by that specific user, the edit\delete option will become visible on the page when the car is displayed.  A user may also edit\delete their profile as well.  Once a user deletes their profile they will be brought back to the base URL\URI and given an opportunity to create a new user by signing up again.

## Installation

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

And then execute:

    $ bundle 
    or 
    $ bundle install

## Usage

Step 1: Clone the following repo https://github.com/Alendor22/sinatra-portfolio-project-adeja-car-collector then cd in to the sinatra-portfolio-project-adeja-car-collector directory.
Step 2: To run this application just type shotgun into the terminal once you have it loaded into the editor of your choice and you followed step 1.  After you type shotgun into the terminal go to the URL\URI provided by the terminal, this will usually be localhost:9393, depending on your computer the port number may be something other than 9393. 
Step 3: Sign up as a new user, enter the info on the form and hit the create user button, then you can begin to create a new car, enter the detail on the form and hit the create car button.  Your newly created car will show up on the next page which is the cars index page, click any link to view info about that car however you can only edit or delete cars you have created.  If you click the link on the car you created you will be given the option to update or delete that car.  You can also update or delete your user info.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Alendor22/sinatra-portfolio-project-adeja-car-collector. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the sinatra-portfolio-project-adeja-car-collector project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Alendor22/sinatra-portfolio-project-adeja-car-collector/blob/master/CODE_OF_CONDUCT.md).