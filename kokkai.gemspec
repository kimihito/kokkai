
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kokkai/version"

Gem::Specification.new do |spec|
  spec.name          = "kokkai"
  spec.version       = Kokkai::VERSION
  spec.authors       = ["kimihito"]
  spec.email         = ["tatsurotamashiro@gmail.com"]

  spec.summary       = %q{http://kokkai.ndl.go.jp/api.html client library, written in Ruby}
  spec.description   = %q{http://kokkai.ndl.go.jp/api.html client library, written in Ruby}
  spec.homepage      = "https://github.com/kimihito/kokkai"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "multi_xml"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec-nc"
end
