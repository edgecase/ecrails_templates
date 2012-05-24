gem 'haml-rails', '~> 0.3.4'

after_bundler do
  get(
    File.join(RECIPES_ROOT, '..', 'templates', 'views', 'application.html.haml'),
    'app/views/layouts/application.html.haml'
  )
  run 'rm app/views/layouts/application.html.erb'
end

