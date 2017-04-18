# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "omniauth-myvr"
  s.version     = "0.1.5"
  s.authors     = ["CJ Avilla"]
  s.email       = ["cjavilla@gmail.com"]
  s.homepage    = "https://github.com/w1zeman1p/omniauth-myvr"
  s.description = %q{OmniAuth strategy for MyVR}
  s.summary     = s.description
  s.license     = "MIT"

  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
    s.files = `git ls-files`.split("\n")
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.require_paths = ["lib"]

  s.add_dependency "omniauth", "~> 1.1"
  s.add_dependency "omniauth-oauth2", "< 1.4"
  # s.add_dependency "oauth2", "~> 1.3.0"
  # s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency "rspec"
    s.add_development_dependency "rake"
    s.add_development_dependency "rubocop"
    
end
