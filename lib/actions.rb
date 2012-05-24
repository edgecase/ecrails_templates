RECIPES_ROOT   = File.join(ROOT, 'recipes')
TEMPLATES_ROOT = File.join(ROOT, 'templates')

@after_bundler = []
@after_readme  = []

def app_name
  destination_root.split('/').last
end

def after_bundler(&block)
  @after_bundler << block
end

def after_readme(&block)
  @after_readme << block
end

def run_recipe(recipe)
  apply File.join(RECIPES_ROOT, "#{recipe}.rb")
end

def add_view(source, destination)
  get(
    File.join(TEMPLATES_ROOT, 'views', source),
    File.join('app', 'views', destination)
  )
end

def add_generator(name)
  get(
    File.join(TEMPLATES_ROOT, 'generators', "#{name}_generator.rb"),
    File.join('lib', 'generators', "#{name}_generator.rb")
  )
end

def add_to_readme(section, text)
  after_readme do
    inject_into_file 'README.md', :after => "## #{section}\n\n" do
      "#{text}\n\n"
    end
  end
end

