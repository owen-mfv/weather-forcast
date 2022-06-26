require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    context "when using gem `vcr`", skip: false do
      before do
        VCR.use_cassette "GET current weather data" do
          get "/"
        end
      end

      it { expect(response.status).to eq 200 }
    end

    context "when not using gem `vcr`", skip: true do
      before do
        get "/"
      end

      it { expect(response.status).to eq 200 }
    end
  end
end
