class StatusController < ApplicationController
  def ok
    render json: { status: "ok" }
  end

  def user
    authenticate_user!
    render json: { status: "user ok" }
  end

  def admin
    authenticate_admin!
    render json: { status: "admin ok" }
  end
end
