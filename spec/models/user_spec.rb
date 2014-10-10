require 'rails_helper'

RSpec.describe User, :type => :model do

  let!(:active_user)   { create :active_user }
  let!(:active_too)    { create :active_user, email: 'too@example.com'}
  let!(:inactive_user) { create :inactive_user }

  describe "::active" do
    it "return the active users" do
      # debugger
      expect(User.active.to_a - [active_user, active_too]).to eq []
    end

    it "d not return the active users" do
      expect(User.inactive.to_a).to_not include active_user
    end
  end

  describe "#actif?" do
    it {expect(active_user.active?).to eq true}
    it {expect(inactive_user.active?).to eq false}
  end

  describe "#activate" do
    it "set active to true" do
     inactive_user.activate
     activated = inactive_user

      expect(activated.active).to eq true
    end
  end

end
