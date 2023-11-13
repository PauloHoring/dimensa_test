# frozen_string_literal: true

module Api
  module V1
    class QuotesController < ApplicationController
      before_action :set_tag, only: [:search_tag]

      def search_tag
        quotes = ::QuoteService::QuoteCrawlerService.crawl_quotes(@tag)
        render json: { quotes: ActiveModel::Serializer::CollectionSerializer.new(quotes, each_serializer: QuoteSerializer) }
      rescue StandardError => e
        render json: { error: e.message }, status: :not_found
      end

      private

      def set_tag
        @tag = params[:tag]
        return unless @tag.blank?

        render json: { error: 'Tag is required' }, status: :bad_request
      end
    end
  end
end
