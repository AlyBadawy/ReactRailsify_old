# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Reacts" do
  describe "GET /index" do
    it "returns http success" do
      get "/react/index"
      expect(response).to have_http_status(:success)
    end
  end

end
