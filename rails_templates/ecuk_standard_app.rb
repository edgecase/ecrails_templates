app_name = FileUtils.getwd.split('/').last
repo = "git@github.com:edgecase/#{app_name}.git"

# >------------------ [ Gems ] ------------------< #

gem "simple_form", :version => "2.0.1"
gem "devise", :version => "2.0.4"

gem_group :development, :test do
  # Pull down this repo as a gem so we can run scripts form bin dir
  gem "ecrails_templates", :git => 'git@github.com:edgecase/ecrails_templates.git'
  gem "rspec-rails", :version => "2.9.0"
end

run "bundle install"

# >------------------ [ Deployment ] ------------------< #

deploy_file = "config/deploy.rb"

say "Creating #{deploy_file}"
run "bundle exec ecuk_generate_deployment.rb -n '#{app_name}' -r '#{repo}' > #{deploy_file}"

# >------------------ [ Tidy up ] ------------------< #

run 'rm public/index.html'

# >------------------ [ Git ] ------------------< #

git :init
git :add => "."
git :commit => "-m 'Created new application using #{__FILE__}'"
git :remote => "add origin #{repo}"