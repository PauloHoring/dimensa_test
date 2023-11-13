# frozen_string_literal: true

module Api
  module V1
    class AuthController < ApplicationController
      USERS = {
        'user_test' => 'secret_test'
      }.freeze

      def create
        user = USERS[params[:username]]
        if user && user == params[:password]
          token = AuthenticateService::JwtService.encode({ username: params[:username] })
          render json: { token: token }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end
    end
  end
end
