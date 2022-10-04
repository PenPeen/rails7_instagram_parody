class RegistrationsController < Devise::RegistrationsController

  # パスワード情報を入力しなくても、ユーザー情報を更新できるような設定
  protected
    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end

    def after_update_path_for(resource)
      user_path(resource)
    end
  end
  