class ApplicationController < ActionController::Base
  #Applicationコントローラーは全てのコントローラーが読まれる前に必ず読まれるコントローラー

  protect_from_forgery with: :exception
  #protect_from_forgery with: :exceptionというコードはクロスサイトリクエストフォージェリ (CSRF)への対応策のコード

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :introduction])
      devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar)) # deviseコントローラにストロングパラメータを追加（プロフィール画像）
  end
  #nameとusernameカラムを保存できるようにする記述はサインアップやアカウントをアップデートするときだけにしか必要

end