require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:valid_attributes) {
    {first_name: 'Durand', last_name: 'Dupond'}
  }

  let(:initial_attributes) {
    { email: "dd@example.com", token: 'qwerty'}
  }

  let(:invalid_attributes) {
    {bad_stuff: 'whatever', no_good: true}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "get token" do
    describe "with valid url" do
      it "assigns the requested user as @user" do
        user = User.create! initial_attributes
        get :token, { token: user.token}, valid_session
        expect(assigns(:user)).to eq user
      end
    end

    describe "with invalid url" do
      it "do not assign @user" do
        user = User.create! initial_attributes
        get :token, { token: 'whatever'}, valid_session
        expect(assigns(:user)).to eq nil
      end

      # TODO add test redirection invalid token and already activated user

    end
  end

  describe "patch update" do
    describe "with valid params" do
      let(:new_attributes) {
        {telephone: '1234567890'}
      }

      it "updates the requested user" do
        user = User.create! initial_attributes
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        user.reload
        expect(assigns(:user).telephone).to eq new_attributes[:telephone]
      end

      it "assigns the requested user as @user" do
        user = User.create! initial_attributes
        patch :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      xit "redirects to the reservation" do
        user = User.create! initial_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(response).to redirect_to(new_reservation)
      end
    end
  end

end
