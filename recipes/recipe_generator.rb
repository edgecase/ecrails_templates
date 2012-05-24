run 'mkdir lib/generators'
add_generator 'recipe'

add_to_readme 'Technology', %Q{You can run any of the recipes after the fact by running
```Bash
rails g recipe <recipe_name>
```
Available recipes:-
#{Dir.entries(RECIPES_ROOT)[2..-1].map{|recipe| recipe.match(/^(.*)\.rb$/)[1]}}
}
