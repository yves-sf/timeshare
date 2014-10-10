require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  let(:valid_attributes) {
    skip(":email")
  }

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
