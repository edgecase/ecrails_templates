libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'recipes/recipe'
require 'recipes/standard_recipe'
require 'recipes/haml_recipe'

