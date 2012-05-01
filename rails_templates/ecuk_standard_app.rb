# >------------------ [ Gems ] ------------------< #

gem "simple_form", {:version => "2.0.1"}
gem "devise"

gem_group :development, :test do
  gem "ecrails_templates", :git => 'git@github.com:edgecase/ecrails_templates.git'
  gem "rspec-rails", {:version => "2.9.0"}
end

# >------------------ [ Deployment ] ------------------< #

