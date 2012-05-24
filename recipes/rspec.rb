insert_into_file 'Gemfile', :after => "group :development, :test do\n" do
  "  gem 'rspec-rails', '~> 2.9.0'\n"
end

after_bundler do
  generate "rspec:install"
  run 'rm -Rf test'
end

add_to_readme 'Testing', 'bundle exec rspec'

