# frozen_string_literal: true

require "rails_helper"

RSpec.describe StatusController do
  describe "GET /ok" do
    it "returns http success" do
      get "/api/status/ok"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /user" do
    it "returns http success when user is signed in" do
      user = create(:user)
      sign_in user
      get "/api/status/user"
      expect(response).to have_http_status(:success)
    end

    it "returns http unauthorized when user is not signed in" do
      get "/api/status/user"
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /admin" do
    it "returns http success when user is admin" do
      admin = create(:user, :admin)
      sign_in admin
      get "/api/status/admin"
      expect(response).to have_http_status(:success)
    end

    it "returns http unauthorized when user is not admin" do
      user = create(:user)
      sign_in user
      get "/api/status/admin"
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns http unauthorized when user is not signed in" do
      get "/api/status/admin"
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
