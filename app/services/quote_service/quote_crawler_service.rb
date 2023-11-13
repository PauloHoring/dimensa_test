# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

module QuoteService
  class QuoteCrawlerService
    def self.crawl_quotes(tag)
      tag_instance = find_tag(tag)
      return tag_instance.quotes if tag_instance.present?

      document = Nokogiri::HTML(URI.open("http://quotes.toscrape.com/tag/#{tag}/"))
      quotes = document.css('.quote')

      raise 'No quotes found for this tag' if quotes.empty?

      quotes.map do |q|
        quote_text = q.css('.text').text
        author = q.css('.author').text
        author_about = "http://quotes.toscrape.com#{q.css('.author + a').attr('href').value}"

        quote = Quote.find_or_initialize_by(quote: quote_text)
        quote.author = author
        quote.author_about = author_about

        tags = []
        q.css('.tag').each do |t|
          quote_tag = Tag.find_or_create_by(name: t.text)
          tags << quote_tag
        end

        next if tags.empty?

        quote.tags = tags
        quote.save
        quote
      end
    end

    class << self
      def find_tag(tag)
        return unless tag.present?

        Tag.where(name: tag).first
      end
    end
  end
end
