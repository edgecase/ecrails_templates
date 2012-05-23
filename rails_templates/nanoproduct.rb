# variables
app_name = destination_root.split('/').last
@recipes = 'https://raw.github.com/edgecase/ecrails_templates/master/recipes/'
@after_bundler = []

# methods
def after_bundler(&block); @after_bundler << block; end
def run_recipe(recipe); apply File.join(@recipes, recipe); end

# setup required recipes
[
  'check_rails_version',
  'standard_gems',
  'rspec',
  'cucumber',
  'devise',
  'heroku',
  'leftovers',
  'git'
].each do |recipe|
  say "Running recipe #{recipe} ...", :yellow
  run_recipe "#{recipe}.rb"
end

# run bundler and then all the after_bundler blocks
run "bundle install"
@after_bundler.each {|b| b.call}

