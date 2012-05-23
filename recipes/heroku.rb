after_bundler do
  heroku_name = app_name.gsub('_', '-')
  if yes?("Create app #{heroku_name} on Heroku? [Y/n]", :yellow)
    run "heroku create #{heroku_name} --stack cedar"
  end
end

