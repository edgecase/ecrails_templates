after_bundler do
  get(
    File.join(RECIPES_ROOT, 'templates', 'views', 'application.html.haml'),
    'app/views/layouts/application.html.haml'
  )
  run 'rm app/views/layouts/application.html.erb'

  generate "controller home index"
  route "root :to => 'home#index'"
  run 'rm public/index.html'
end

