# encoding: utf-8

Gem::Specification.new do |gem|
  gem.add_dependency 'actionpack', '>= 0'
  gem.add_development_dependency 'hpricot', '~> 0.8'
  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rdoc', '~> 3.9'
  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'simplecov', '~> 0.4'
  gem.authors = ["Matt Sanford", "Patrick Ewing", "Ben Cherry", "Britt Selvitelle", "Raffi Krikorian"]
  gem.description = "A gem that provides text handling for Twitter"
  gem.email = ['matt@twitter.com', 'patrick.henry.ewing@gmail.com', 'bcherry@gmail.com', 'bs@brittspace.com', 'raffi@twitter.com']
  gem.files = Dir['LICENSE', 'README.rdoc', 'Rakefile', 'TODO', 'lib/**/*', 'spec/**/*']
  gem.homepage = 'http://twitter.com'
  gem.name = 'twitter-text'
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  gem.summary = "Twitter text handling library"
  gem.test_files = Dir['spec/**/*']
  gem.version = '1.2.4'
end
