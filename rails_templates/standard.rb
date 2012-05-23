require File.join(File.dirname(__FILE__), '..', 'lib/recipes')

recipes = [StandardRecipe]
optional_recipes = [HamlRecipe]

optional_recipes.each do |opt_rec|
  name = opt_rec.name.match(/(.*)Recipe$/)[1]
  response = ask "Would you like to run the #{name} recipe? (Y/n)"
  if response.downcase[0] == 'y'
    recipes << opt_rec
  end
end

recipes.map! { |r| r.new(self) }

recipes.each do |r|
  r.before_bundler
end

run 'bundle install'

recipes.each do |r|
  r.after_bundler
end

