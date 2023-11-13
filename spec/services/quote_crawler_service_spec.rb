# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuoteService::QuoteCrawlerService do
  let(:params) { 'life' }
  let(:params_invalid) { 'inexistent' }

  context 'methods' do
    it '#crawl_quotes' do
      expect(described_class).to respond_to(:crawl_quotes)
    end
  end

  context 'service' do
    describe 'when param is valid' do
      it 'reponse is valid' do
        response = described_class.crawl_quotes(params)

        expect(response).to be_a(Array)
      end

      it 'response is invalid' do
        expect do
          described_class.crawl_quotes(params_invalid)
        end.to raise_error(RuntimeError, 'No quotes found for this tag')
      end
    end
  end
end
