# variables
app_name = destination_root.split('/').last
@recipes = 'https://raw.github.com/gist/'
@after_bundler = []
def after_bundler(&block); @after_bundler << block; end
def run_recipe(recipe); apply File.join(@recipes, recipe); end

# check rails version is compatible
run_recipe '8f4d53b44eab7b8e4422/78e8ab44167ec221d80f829802887727a465f1f1/check_rails_version.rb'

# load standard gems
run_recipe 'ce262cd6096bb1a0f2ba/c8ec9c2da33600e0a01dde6ed2575b97f64674eb/standard_gems.rb'

# load RSpec
run_recipe '6159e5ce1b73fed03006/f0cef35b3302a2432068306be07546f197b1615d/rspec.rb'

# load Cucumber and friends
run_recipe '240349c8a2714f7d8a60/e072e10d23f53606ecb574915e09ebf38505d1c4/cucumber.rb'

# load Devise
run_recipe '84817bc45ce4bd07846b/f4dd9ae0b26fd8b04d78ede3cb4a287248749df4/devise.rb'

# Load Heroku
run_recipe 'df5d8cc3936efdf3f7cd/a20b0d629f4efd544d9bdf29a90f2b162a6b92c5/heroku.rb'

# run bundler and then all the after_bundler blocks
run "bundle install"
@after_bundler.each {|b| b.call}

# leftovers
run_recipe '5befb7207c416fc20ef0/d4ff63b3e2c2d528aa7a7642e867109847fb4f27/leftovers.rb'

# initial commit
run_recipe 'cfe301078bd52b234cb2/b0a7d3c2d78602708f9ed3c3376560b3689ae4a9/git.rb'
