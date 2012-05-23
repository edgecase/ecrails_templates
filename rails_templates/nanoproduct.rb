# variables
app_name = destination_root.split('/').last
@recipes = 'https://raw.github.com/edgecase/ecrails_templates/master/recipes/'
@after_bundler = []
def after_bundler(&block); @after_bundler << block; end
def run_recipe(recipe); apply File.join(@recipes, recipe); end

# check rails version is compatible
run_recipe 'check_rails_version.rb'

# load standard gems
run_recipe 'standard_gems.rb'

# load RSpec
run_recipe 'rspec.rb'

# load Cucumber and friends
run_recipe 'cucumber.rb'

# load Devise
run_recipe 'devise.rb'

# Load Heroku
run_recipe 'heroku.rb'

# run bundler and then all the after_bundler blocks
run "bundle install"
@after_bundler.each {|b| b.call}

# leftovers
run_recipe 'leftovers.rb'

# initial commit
run_recipe 'git.rb'

