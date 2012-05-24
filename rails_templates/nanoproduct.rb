ROOT = 'https://raw.github.com/edgecase/ecrails_templates/master'

apply File.join(ROOT, 'lib', 'actions.rb')

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
  'file_upload',
  'error_reporting',
  'leftovers',
  'git',
  'heroku'
]

RECIPES.each do |recipe|
  run_recipe recipe
end

# run bundler and then all the after_bundler blocks
say "Running bundler ...", :yellow

run "bundle install"
@after_bundler.each {|b| b.call}

# build README file
say "Building README ...", :yellow

run 'rm README.rdoc'
get File.join(TEMPLATES_ROOT, 'README.md'), 'README.md'
@after_readme.each {|b| b.call}

inject_into_file 'README.md', :after => "## Technology\n\n" do
  %Q{* Ruby #{RUBY_VERSION}\n* Rails #{Rails::VERSION::STRING}\n\n}
end

