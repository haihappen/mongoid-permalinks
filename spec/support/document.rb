class Document
  include Mongoid::Document
  include Mongoid::Permalink

  field :name, type: String

  alias_method :to_s, :name
end

class Localized
  include Mongoid::Document
  include Mongoid::Permalink

  field :name,      type: String, localize: true
  field :permalink, type: String, localize: true

  alias_method :to_s, :name
end
