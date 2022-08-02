require 'rails_helper'

RSpec.describe "Straps", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/straps/index"
      expect(response).to have_http_status(:success)
    end
  end

end
