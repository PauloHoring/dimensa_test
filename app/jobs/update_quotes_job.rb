# frozen_string_literal: true

class UpdateQuotesJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    tags = Tag.all

    tags.each do |tag|
      QuoteService::QuoteCrawlerService.crawl_quotes(tag.name)
    end
  end
end
