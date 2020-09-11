require_relative 'lib/pizzabot/version'
require_relative 'lib/pizzabot/instructions'

Gem::Specification.new do |spec|
  spec.name          = "pizzabot"
  spec.version       = Pizzabot::VERSION
  spec.authors       = [""]
  spec.email         = [""]

  spec.summary       = %q{ Instructions for delivering pizza with pizzabot. }
  spec.description   = %q{ On a 5 x 5 grid, given grid coordinates, the pizzabot function will return a list with directions for reaching the coordinates.}
  spec.homepage      = ""
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = ""
  spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec", "~> 3.2"
end
