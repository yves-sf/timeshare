class UsersController < InheritedResources::Base
  actions :show, :update
  respond_to :html


  def token
    @user = User.where(token: params[:token]).first
    if @user
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
      format.html { render :show }
    end
    #todo redirect_to new reservation
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :telephone)
  end

end

