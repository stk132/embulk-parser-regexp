
Gem::Specification.new do |spec|
  spec.name          = "embulk-parser-regexp"
  spec.version       = "0.1.0"
  spec.authors       = ["stk132"]
  spec.summary       = "Regexp parser plugin for Embulk"
  spec.description   = "Parses Regexp files read by other file input plugins."
  spec.email         = ["stk0724@gmail.com"]
  spec.licenses      = ["MIT"]
  # TODO set this: spec.homepage      = "https://github.com/stk0724/embulk-parser-regexp"

  spec.files         = `git ls-files`.split("\n") + Dir["classpath/*.jar"]
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  #spec.add_dependency 'YOUR_GEM_DEPENDENCY', ['~> YOUR_GEM_DEPENDENCY_VERSION']
  spec.add_development_dependency 'bundler', ['~> 1.0']
  spec.add_development_dependency 'rake', ['>= 10.0']
end
