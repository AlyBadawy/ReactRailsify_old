# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token

    respond_to :json

    private

    def respond_with(_resource, _opts = {})
      render json: current_user, status: :ok
    end

    def respond_to_on_destroy
      log_out_success && return if current_user

      log_out_failure
    end

    def log_out_success
      render json: { message: "You are logged out." }, status: :ok
    end

    def log_out_failure
      render json: { message: "Hmm nothing happened." }, status: :unauthorized
    end
  end
end
