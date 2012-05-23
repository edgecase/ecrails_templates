after_bundler do
  generate "controller home index"
  route "root :to => 'home#index'"
  get 'https://raw.github.com/gist/bc2938ee40dd903aa4ab/f32d6f3309ad5ec1b023e50475f6e32296d6b81e/application.html.haml', 'app/views/layouts/application.html.haml'
  run 'rm app/views/layouts/application.html.erb'
  run 'rm public/index.html'
  run 'rm -Rf test'
end

