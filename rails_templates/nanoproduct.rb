RECIPES_ROOT = 'https://raw.github.com/edgecase/ecrails_templates/master/recipes/'

@after_bundler = []

# setup required recipes
RECIPES = [
  'check_rails_version',
  'standard_gems',
  'recipe_generator',
  'rspec',
  'cucumber',
  'devise',
  'heroku',
  'leftovers',
  'git'
]

def app_name
  destination_root.split('/').last
end

def after_bundler(&block)
  @after_bundler << block
end

def run_recipe(recipe)
  apply File.join(RECIPES_ROOT, "#{recipe}.rb")
end

RECIPES.each do |recipe|
  say "Running recipe #{recipe} ...", :yellow
  run_recipe recipe
end

# run bundler and then all the after_bundler blocks
run "bundle install"
@after_bundler.each {|b| b.call}

