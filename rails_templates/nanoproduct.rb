RECIPES_ROOT = 'https://raw.github.com/edgecase/ecrails_templates/master/recipes/'
TEMPLATES_ROOT = File.join(RECIPES_ROOT, '..', 'templates')

@after_bundler = []
@after_readme  = []

# setup required recipes
RECIPES = [
  'check_rails_version',
  'standard_gems',
  'recipe_generator',
  'rspec',
  'cucumber',
  'factory_girl',
  'devise',
  'postgres',
  'haml',
  'twitter',
  'facebook',
  'markdown',
  'error_reporting',
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

def after_readme(&block)
  @after_readme << block
end

def run_recipe(recipe)
  apply File.join(RECIPES_ROOT, "#{recipe}.rb")
end

def add_view(source, destination)
  get(
    File.join(TEMPLATES_ROOT, 'views', source),
    File.join('app', 'views', destination)
  )
end

def add_generator(name)
  get(
    File.join(TEMPLATES_ROOT, 'generators', "#{name}_generator.rb"),
    File.join('lib', 'generators', "#{name}_generator.rb")
  )
end

def add_to_readme(section, text)
  after_readme do
    inject_into_file 'README.md', :after => "## #{section}\n\n" do
      "#{text}\n\n"
    end
  end
end

RECIPES.each do |recipe|
  say "Running recipe #{recipe} ...", :yellow
  run_recipe recipe
end

# run bundler and then all the after_bundler blocks
run "bundle install"
@after_bundler.each {|b| b.call}

# build README file
run 'rm README.rdoc'
get File.join(TEMPLATES_ROOT, 'README.md'), 'README.md'

@after_readme.each {|b| b.call}

inject_into_file 'README.md', :after => "## Technology\n\n" do
  %Q{* Ruby #{RUBY_VERSION}\n* Rails #{Rails::VERSION::STRING}\n\n}
end

