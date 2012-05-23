after_bundler do
  generate "controller home index"
  route "root :to => 'home#index'"
  get 'https://raw.github.com/edgecase/ecrails_templates/master/templates/application.html.haml', 'app/views/layouts/application.html.haml'
  run 'rm app/views/layouts/application.html.erb'
  run 'rm public/index.html'
end

