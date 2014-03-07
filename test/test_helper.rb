$: << File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'

require 'mongoid/permalinks'

I18n.available_locales = [:en, :de]
I18n.enforce_available_locales = true

Mongoid.load!(File.expand_path('../mongoid.yml', __FILE__), 'test')
