class StandardRecipe < Recipe
  def initialize(scope)
    @app_name = FileUtils.getwd.split('/').last
    @repo = "git@github.com:edgecase/#{@app_name}.git"
    super(scope)
  end

  def before_bundler
    run "rm Gemfile"

    create_file "Gemfile", "source :rubygems\n\ngem 'rails', '#{Rails::VERSION::STRING}'\n"

    gem 'jquery-rails'
    gem 'simple_form',      '~> 2.0.1'
    gem 'devise',           '~> 2.0.4'
    gem 'friendly_id',      '~> 4.0.5'
    gem 'decent_exposure',  '~> 1.0.2'

    # >------------------ [ Tidy up ] ------------------< #

    run 'rm public/index.html'
    run 'rm -Rf test'

    # >------------------ [ Git ] ------------------< #

    git :init
    git :add => "."
    git :commit => "-m 'Created new application using #{__FILE__}'"
    git :remote => "add origin #{@repo}"
  end

  def after_bundler
    generate 'rspec:install'
    generate 'devise:install'
  end
end

