require 'rails_helper'

RSpec.describe User, :type => :model do

  let!(:active_user)   { create :active_user }
  let!(:active_too)    { create :active_user, email: 'too@example.com'}
  let!(:inactive_user) { create :inactive_user }

  describe "::active" do
    it "return the active users" do
      expect(User.active.to_a - [active_user, active_too]).to eq []
    end

    it "do not return the active users" do
      expect(User.inactive.to_a).to_not include active_user
    end
  end

  describe "#active?" do
    it {expect(active_user.active?).to eq true}
    it {expect(inactive_user.active?).to eq false}
  end
  describe "#inactive?" do
    it {expect(inactive_user.inactive?).to eq true}
    it {expect(active_user.inactive?).to eq false}
  end

  describe "#activate" do
    it "set active to true" do
     inactive_user.activate
     activated = inactive_user

      expect(activated.active).to eq true
    end

    context "already activated user" do
      it{expect(active_user.activate).to eq nil}
    end
  end

  describe "validations" do
    let(:bad_email_format) { build :active_user, email: "ertyertyu" }
    # subject { active_user }
    context "already existing customer" do
      it { is_expected.to validate_uniqueness_of :email }
      it { is_expected.to validate_presence_of   :email }
      it { expect(bad_email_format).to_not be_valid}
    end
  end
end
