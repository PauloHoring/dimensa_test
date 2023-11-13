# frozen_string_literal: true

class QuoteSerializer < ActiveModel::Serializer
  attributes :quote, :author, :author_about, :tags

  def tags
    object.tags.map(&:name)
  end
end
