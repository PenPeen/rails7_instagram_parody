class UsersController < ApplicationController
    before_action :authenticate_user!

    # プロフィール画面の表示
    def show
        @user = User.find(params[:id])
    end
end
