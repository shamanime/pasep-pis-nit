# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pasep-pis-nit/version'

Gem::Specification.new do |spec|
  spec.name          = 'pasep-pis-nit'
  spec.version       = PasepPisNit::VERSION
  spec.authors       = ['Jefferson Queiroz Venerando']
  spec.email         = ['jefferson@shamani.me']
  spec.summary       = %q{Validação de PASEP/PIS/NIT para sua aplicação.}
  spec.description   = %q{Validação de PASEP/PIS/NIT para sua aplicação.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency "activerecord", "~> 4.0"
  spec.add_dependency "activemodel", "~> 4.0"

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '>= 0'
end
