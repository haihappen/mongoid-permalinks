require_relative 'test_helper'

class Document
  include Mongoid::Document
  include Mongoid::Permalinks

  field :name, type: String

  alias_method :to_s, :name
end

class Localized < Document
  field :name,      type: String, localize: true
  field :permalink, type: String, localize: true
end


class PermalinksTest < Minitest::Unit::TestCase
  def test_it_responds_to_permalink_field
    assert_equal String, Document.fields['permalink'].type
  end


  def test_providing_an_permalink
    assert_equal 'custom-permalink', Document.create(permalink: 'Custom Permalink', name: 'Name').permalink
  end


  def test_providing_an_empty_permalink_uses_name_instead
    assert_equal 'name', Document.create(permalink: '', name: 'Name').permalink
  end


  def test_providing_an_permalink_with_trailing_spaces
    assert_equal 'custom-permalink', Document.create(permalink: '  Custom   Permalink  ', name: 'Name').permalink
  end


  def test_providing_an_permalink_with_special_characters
    assert_equal 'mario-u', Document.create(permalink: 'Mario U.', name: 'Name').permalink
  end


  def test_underscores_are_removed
    assert_equal 'custom-permalink', Document.create(permalink: 'custom_permalink', name: 'Name').permalink
  end


  def test_localized_permalink
    document = Localized.new

    I18n.locale = :en
    document.update_attributes permalink: 'English'

    assert_equal 'english', document.permalink

    I18n.locale = :de
    document.update_attributes permalink: 'Deutsch'

    assert_equal 'deutsch', document.permalink

    I18n.locale = :en

    assert_equal 'english', document.permalink
  end
end
