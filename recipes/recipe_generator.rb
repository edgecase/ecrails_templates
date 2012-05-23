run 'mkdir lib/generators'
get(
  File.join(RECIPES_ROOT, '..', 'templates', 'generators', 'recipe_generator.rb'),
  'lib/generators/recipe_generator.rb'
)
