class UsersController < InheritedResources::Base
  actions :show, :update
  respond_to :html


  def token
    @user = User.where(token: params[:token]).first
    if @user
      session[:user_id] = @user.id.to_s
      if @user.inactive?
        @user.activate
      else
        # todo redirect to show reservation
      end
    else
      # todo token not found - redirect register first
    end
  end

  def update
    update! do |format|
      format.html { redirect_to new_reservation_path }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :telephone)
  end

end

