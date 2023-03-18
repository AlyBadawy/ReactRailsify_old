class StatusController < ApplicationController
  before_action :authenticate_user!, only: [:user]
  before_action :authenticate_admin!, only: [:admin]

  def ok
    render json: { status: "ok" }
  end

  def user
    render json: { status: "user ok" }
  end

  def admin
    render json: { status: "admin ok" }
  end
end
