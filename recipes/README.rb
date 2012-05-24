run 'rm README.rdoc'

get File.join(TEMPLATES_ROOT, 'README.md'), 'README.md'
inject_into_file 'README.md', :after => "## Technology\n" do
  %Q{. Ruby #{RUBY_VERSION}\n . Rails #{Rails::VERSION::STRING}\n}
end

@after_readme.each {|b| b.call}

