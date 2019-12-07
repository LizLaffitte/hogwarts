lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hogwarts/version"

Gem::Specification.new do |spec|
  spec.name          = "hogwarts"
  spec.version       = Hogwarts::VERSION
  spec.authors       = ["Liz Laffitte"]
  spec.email         = ["laffitte.digital@gmail.com"]

  spec.summary       = "CLI gem project for Flatiron by Liz Laffitte"
  spec.description   = "This CLI gem sorts users in a Hogwarts house and then lets them request information about the houses and fellow students."
  spec.homepage      = "https://github.com/LizLaffitte/hogwarts"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/LizLaffitte/hogwarts"
  spec.metadata["changelog_uri"] = "https://github.com/LizLaffitte/hogwarts"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "pry"
end
