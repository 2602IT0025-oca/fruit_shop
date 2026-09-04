class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
class ApplicationController < ActionController::Base
  # Deviseのコントローラ実行時にストロングパラメータを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップ時に name と admin_flg を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin_flg])
  end
  class MypageController < ApplicationController
  # ログインユーザのみアクセス許可
  before_action :authenticate_user!

  def show
    # 指定されたIDのユーザ情報を取得
    @user = User.find(params[:id])
  end

  private

    # 許可するユーザ情報のパラメータ
    def user_params
      params.require(:user).permit(:name, :email, :admin_flg)
    end
    class Users::RegistrationsController < Devise::RegistrationsController
  # 省略

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    mypage_path(resource)
  end
