# frozen_string_literal: true

require_relative "lib/rails_generators/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_generators"
  spec.version       = RailsGenerators::VERSION
  spec.authors       = ["Karamat Ullah"]
  spec.email         = ["karamatullah46@gmail.com"]

  spec.summary       = "Extended Rails Generators"
  spec.description   = "Extended Rails Generators"
  spec.homepage      = "https://www.github.com/karamat/rails_generators"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://www.github.com/karamat/rails_generators"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/karamat/rails_generators"
  spec.metadata["changelog_uri"] = "https://www.github.com/karamat/rails_generators"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
