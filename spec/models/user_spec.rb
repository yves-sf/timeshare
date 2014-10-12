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
    context "email" do
      let(:bad_email_format) { build :active_user, email: "ertyertyu" }

      it { is_expected.to validate_uniqueness_of :email }
      it { is_expected.to validate_presence_of   :email }
      it { expect(bad_email_format).to_not be_valid}
    end

    context "telephone" do
      context "bad phone" do
        let(:bad_phone_format) { build :active_user, telephone: "ertyertyu" }

        it { is_expected.to validate_presence_of :telephone }
      end

      context "good phone formats"
      ['1234567890', '123-456-7890', '123 456 7890', '123:456:7890'].each do |valid_tel|
        let(:good_phone) { build :active_user, telephone: valid_tel }
        it { expect(good_phone).to_not be_valid }
      end
    end
  end
end
