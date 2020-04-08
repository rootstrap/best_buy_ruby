# frozen_string_literal: true

require_relative 'lib/best_buy/base/version'

Gem::Specification.new do |spec|
  spec.name          = 'best_buy_ruby'
  spec.version       = BestBuy::Base::VERSION
  spec.authors       = ['Sandro Damilano']
  spec.email         = ['sandro.damilano@rootstrap.com']

  spec.summary       = 'A wrapper for Best Buy APIs.'
  spec.homepage      = 'https://github.com/rootstrap/best_buy_ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/rootstrap/best_buy_ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/rootstrap/best_buy_ruby'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Production dependencies
  spec.add_dependency 'activesupport', ['>= 4', '< 7']
  spec.add_dependency 'faraday', '~> 1.0'

  # Development dependencies
  spec.add_development_dependency 'ammeter', '~> 1.1'
  spec.add_development_dependency 'railties', '~> 6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'reek', '~> 5.6'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.80'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'webmock', '~> 3.8'
end
