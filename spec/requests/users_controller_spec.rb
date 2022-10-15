require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#show" do
    
    before do
      @user = FactoryBot.create(:user)
    end
    
    context "ログインしている場合" do
      it "プロフィルールが正しく表示されること" do
        sign_in @user
        get "/users/#{@user.id}"
        expect(response).to have_http_status 200
      end

      context "自身のプロフィールの場合" do
        it "編集ボタンが表示されること" do
          sign_in @user
          get "/users/#{@user.id}"
          expect(response.body).to include("プロフィールを編集")
        end
      end

      context "他人のプロフィールの場合" do
        it "編集ボタンが表示されないこと" do
          other_user = FactoryBot.create(:user)
          sign_in @user
          get "/users/#{other_user.id}"
          expect(response.body).not_to include("プロフィールを編集")
        end
      end
    end
    
    context "ログインしていない場合" do
      it "ログインページにリダイレクトされること" do
        get "/users/#{@user.id}"
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end
