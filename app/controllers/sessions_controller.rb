class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.new(email: params["email"], token: SecureRandom.urlsafe_base64)
    @host = request.host_with_port
    respond_to do |format|
      format.html do
        if @user.save
          UserMailer.confirmation_request(@user, @host).deliver
        else
          render action: :index
        end
      end
    end


  end
end
