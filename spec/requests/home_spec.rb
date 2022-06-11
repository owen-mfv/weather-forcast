require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    before do
      VCR.use_cassette "GET current weather data" do
        get "/"
      end
    end

    it { expect(response.status).to eq 200 }
  end
end
