# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::QuotesController, type: :controller do
  let(:params) { { tag: 'life' } }
  let(:params_invalid) { { tag: 'inexistent' } }
  let(:user) { 'user_test' }
  let(:token) { AuthenticateService::JwtService.encode({ username: user }) }

  before do
    request.headers['Authorization'] = "Bearer #{token}"
  end

  context 'GET #search_tag' do
    describe 'when params are valid' do
      it 'sucessfull request' do
        get :search_tag, params: params
        expect(response).to have_http_status(200)
      end

      it 'response status 404' do
        get :search_tag, params: params_invalid
        expect(response).to have_http_status(404)
      end
    end
  end
end
