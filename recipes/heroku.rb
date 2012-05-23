def got_heroku?; res = run('gem list heroku'); p res; res.present?; end

run 'gem install heroku' unless got_heroku?

after_bundler do
  heroku_name = app_name.gsub('_', '-')
  if yes?("Create app #{heroku_name} on Heroku? [Y/n]")
    run "heroku create #{heroku_name} --stack cedar"
  end
end

