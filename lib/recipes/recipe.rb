class Recipe
  include Thor::Shell

  def initialize(scope)
    @scope = scope
  end

  def gem(name, *args)
    options = args.extract_options!
    version = args.first
    @scope.gem name, version, options
  end

  def gem_group(*names, &block)
    @scope.gem_group(names, block)
  end

  def generate(what, *args)
    @scope.generate(what, args)
  end

  def git(commands)
    @scope.git(commands)
  end

  def create_file(name, content)
    @scope.create_file name, content
  end

  def run(command)
    @scope.run command
  end
end

