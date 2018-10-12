
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "laminar/rails/version"

Gem::Specification.new do |spec|
  spec.name          = "laminar-rails"
  spec.version       = Laminar::Rails::VERSION
  spec.authors       = ["Robert Lockerd"]
  spec.email         = ["rmlockerd@gmail.com"]

  spec.summary       = %q{Laminar gem support for Rails applications.}
  spec.homepage      = "https://github.com/rmlockerd/laminar-rails"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', ">= 4.2", "< 5.3"
  spec.add_dependency 'laminar', "~> 0.4"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "aruba", "~> 0.14"
  spec.add_development_dependency 'simplecov', '~> 0.16'
end
