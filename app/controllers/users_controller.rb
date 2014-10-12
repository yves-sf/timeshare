class UsersController < InheritedResources::Base
  actions :show, :update
  respond_to :html


  def token
    @user = User.where(token: params[:token]).first
    unless @user
      session[:user_id] = @user.id.to_s
      if @user.inactive?
        @user.activate
      elsif @user.reservations.any?
        redirect_to @user.reservations.first
      else
        # nothing to do just render user_profile
      end
    else
      redirect_to  "/", alert: "User not found"
    end
  end

  def update
    if @user = User.where(email: params[:email])
      render token and return
    end
    update! do |format|
      format.html { redirect_to new_reservation_path }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :telephone)
  end

end

