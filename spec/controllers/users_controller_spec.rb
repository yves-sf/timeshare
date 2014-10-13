require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:valid_attributes) {
    {first_name: 'Durand', last_name: 'Dupond', telephone: '123-456-7890'}
  }

  let(:initial_attributes) {
    { email: "dd@example.com", token: 'qwerty', telephone: '123-456-7890'}
  }

  let(:invalid_attributes) {
    {bad_stuff: 'whatever', no_good: true}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "get token" do
    context "with valid url" do
      context "new user" do
        let!(:inactive_user) { create :inactive_user }

        it "assigns the requested" do
          get :token, { token: inactive_user.token}, valid_session
          expect(assigns(:user)).to eq inactive_user
        end
      end

      context "already confirmed user" do
        let!(:active_user) { create :active_user }

        context "with reservation" do
          let!(:reservation) { active_user.reservations.create additional_questions: "Is the sky blue?" }
          before { get :token, { token: active_user.token}, valid_session }

          it { expect(response.status).to eq 302 }
          it { expect(response.header['Location']).to include "reservations/#{reservation.id}" }
        end

        context "without reservation go to profile page" do
          before { get :token, { token: active_user.token}, valid_session }

          it { expect(response.status).to eq 200 }
          it { expect(assigns(:user)).to eq active_user }
        end
      end
    end

    context "with invalid url" do
      before :each do
        get :token, { token: 'whatever'}, valid_session
      end
      it { expect(assigns(:user)).to eq nil }
      it { expect(response).to redirect_to("/") }
    end
  end

  describe "patch update" do
    describe "with valid params" do
      let(:new_attributes) { {telephone: '1234567890'} }
      let!(:user) { User.create! initial_attributes }
      before do
        valid_user_session = {user_id: user.id}
        put :update, {:id => user.to_param, :user => new_attributes}, valid_user_session
      end

      it { expect(assigns(:user).telephone).to eq new_attributes[:telephone] }
      it { expect(assigns(:user)).to eq(user) }
      it { expect(response).to redirect_to(new_reservation_path) }
    end
  end
end
