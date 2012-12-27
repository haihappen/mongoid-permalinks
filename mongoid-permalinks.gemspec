require './lib/mongoid/permalinks/version'

Gem::Specification.new do |gem|
  gem.name          = 'mongoid-permalinks'
  gem.version       = Mongoid::Permalinks::VERSION
  gem.authors       = 'Mario Uher'
  gem.email         = 'uher.mario@gmail.com'
  gem.homepage      = 'https://github.com/haihappen/mongoid-permalinks'
  gem.summary       = 'Permalinks for your Mongoid documents.'
  gem.description   = 'Mongoid::Permalink adds a permalink based on your document to_s method.'

  gem.files         = `git ls-files`.split("\n")
  gem.require_path  = 'lib'

  gem.add_dependency 'activesupport'
  gem.add_dependency 'mongoid'
end
