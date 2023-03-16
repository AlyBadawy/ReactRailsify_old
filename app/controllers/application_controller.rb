# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  def authenticate_admin!
    authenticate_user! && current_user.admin?
  end
end
