class SessionsController < ApplicationController


  def create
    @user = User.new(email: params["email"], token: SecureRandom.urlsafe_base64)
    @host = request.host_with_port
    respond_to do |format|
      format.html do
        if @user.save
          UserMailer.confirmation_request(@user, @host).deliver
        else
          redirect_to "/", notice: "Email #{params[:email]} already taken of format error"
        end
      end
    end
  end
end
