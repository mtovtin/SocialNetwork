class RegistrationsController < Devise::RegistrationsController
  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: root_path)
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: root_path)
  end
  private

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
end

def account_update_params
  params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
end

end
