run "rm Gemfile"

create_file "Gemfile"

add_source(:rubygems)

gem 'rails', Rails::VERSION::STRING

gem_group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
end

gem_group :test do
  gem 'factory_girl_rails', '~> 3.0.0'
end

gem_group :staging, :production do
  gem 'pg'
end

gem_group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml-rails', '~> 0.3.4'
gem 'friendly_id'
gem 'omniauth-twitter', '~> 0.0.9'
gem 'omniauth-facebook', '~> 1.2.0'
gem 'twitter', '~> 2.2.0'
gem 'fb_graph', '~> 2.4.10'
gem 'rdiscount'
gem 'decent_exposure'
gem 'state_machine', '~> 1.1.2'
gem 'airbrake'

