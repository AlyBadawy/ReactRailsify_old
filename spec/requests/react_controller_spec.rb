# frozen_string_literal: true

require "rails_helper"

RSpec.describe ReactController do
  describe "GET /" do
    it "returns http success", pending: "Fix SASS" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end
end
