require 'active_support'
require 'mongoid'

module Mongoid
  module Permalinks
    extend ActiveSupport::Concern

    included do
      field :permalink, type: String

      before_save :set_permalink
    end

  private
    def set_permalink
      self.permalink = (permalink.presence || to_s).dasherize.parameterize
    end
  end
end
