# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  def authenticate_admin!
    return if current_user&.admin?

    render json: { error: "Not authorized" }, status: :unauthorized
  end
end
