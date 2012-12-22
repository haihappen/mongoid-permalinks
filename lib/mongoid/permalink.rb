require 'active_support'
require 'mongoid'

module Mongoid
  module Permalink
    extend ActiveSupport::Concern

    included do
      field :permalink, type: String

      before_save :set_permalink
    end

  private
    def set_permalink
      self.permalink = (permalink.presence || to_s).parameterize
    end
  end
end
