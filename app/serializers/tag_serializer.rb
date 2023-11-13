# frozen_string_literal: true

class TagSerializer < ActiveModel::Serializer
  attributes :name
  has_many :quotes, serializer: QuoteSerializer
end
