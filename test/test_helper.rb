$: << File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'

require 'mongoid/permalinks'

# Load support *.rb files in ./support
Mongoid.load!(File.expand_path('../mongoid.yml', __FILE__), 'test')
