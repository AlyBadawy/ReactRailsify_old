# frozen_string_literal: true

class StatusController < ApplicationController
  before_action :authenticate_user!, only: [:user, :me]
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

  def me
    render json: current_user
  end
end
