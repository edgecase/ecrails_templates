run 'mkdir lib/generators'
add_generator 'recipe'

add_to_readme 'Technology', %Q{You can run any of the recipes after the fact by running
```Bash
rails g recipe <recipe_name> # minus the file root i.e. rails g recipe haml
```
Available recipes can be found in #{RECIPES_ROOT}
}

