require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require './lib/mongoid/permalinks'

# Load support *.rb files in ./support
Dir[File.expand_path('../support/*.rb', __FILE__)].each { |file| require file }
