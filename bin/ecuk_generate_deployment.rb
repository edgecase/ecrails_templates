require 'erb'
require 'optparse'

def expect(options, *param_defs)
  errors = []
  param_defs.collect do |option_name, human_name|
    if !options[option_name]
      errors << "You must specify a value for #{human_name}"
    end
  end
  if !errors.empty?
    errors.each {|error| STDERR.puts error}
    STDERR.puts %x{ruby #{__FILE__} --help}
    exit 1
  end
end

options = {}
OptionParser.new do|opts|
  opts.on('-n', '--name APP_NAME', 'Application name') do |app_name|
    options[:app_name] = app_name
  end

  opts.on('-r', '--repo GIT_REPO', 'Git Repository - e.g. git@github.com:edgecase/ecrails_templates.git') do |repo|
    options[:repo] = repo
  end

  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
end.parse!

expect options, [:app_name, "application name"], [:repo, "git repository"]

here = File.expand_path(File.dirname(__FILE__))
deployments = File.join(here, '..', 'deployments')
template = File.read(File.join(deployments, 'ecuk_standard_deployment.rb.erb' ))

@app_name = options[:app_name]
@repository = options[:repo]
puts ERB.new(template).result(binding)


