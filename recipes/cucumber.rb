insert_into_file 'Gemfile', :after => "group :test do\n" do
  "  gem 'cucumber-rails', '~> 1.3.0'\n  gem 'database_cleaner', '~> 0.7.1'\n  gem 'capybara', '~> 1.1.2'\n"
end

after_bundler do
  generate 'cucumber:install'
end

