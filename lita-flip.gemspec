Gem::Specification.new do |spec|
  spec.name          = "lita-flip"
  spec.version       = "1.0.1"
  spec.authors       = ["Zac Stewart"]
  spec.email         = ["zgstewart@gmail.com"]
  spec.description   = %q{A handler for Lita that angrily flips your text.}
  spec.summary       = %q{A handler for Lita that angrily flips your text.}
  spec.homepage      = "https://github.com/zacstewart/lita-flip"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0.beta2"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
