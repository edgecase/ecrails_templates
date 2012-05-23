class HamlRecipe < Recipe
  def before_bundler
    gem 'haml'
  end

  def after_bundler
    say 'This happens after bundler'
  end
end

