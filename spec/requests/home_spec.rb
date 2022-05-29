require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    before { get "/" }

    it { expect(response.status).to eq 200 }
  end
end
