require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#show" do
    
    context "ログインしている場合" do
      it "プロフィルールページが正しく表示されること" do
        user = FactoryBot.create(:user)
        sign_in user
        get "/users/#{user.id}"
        expect(response).to have_http_status(200)
      end
    end
    
    context "ログインしていない場合" do
      it "ログインページにリダイレクトされること" do
        user = FactoryBot.create(:user)
        get "/users/#{user.id}"
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

# context "自身のプロフィールページの場合" do
#   it "編集ボタンが表示されること" do
#     user = FactoryBot.create(:user)
#     sign_in user
#     get "/users/#{user.id}"
#     expect(page).to have_selector 'a', text: 'プロフィールを編集'
#   end
# end

# context "自身のプロフィールではない場合" do
#   it "編集ボタンが表示されないこと" do
#     user = FactoryBot.create(:user)
#     user2 = FactoryBot.create(:user)
#     sign_in user
#     get "/users/#{user2.id}"
#     expect(response.body).not_to include("<a class='btn btn-outline-dark common-btn edit-profile-btn' href='/users/edit'>プロフィールを編集</a>")
#   end
# end

# it "モックテスト" do
#   users_controller = UsersController.new
#   # モックの作成
#   update_mock = double('UpdateメソッドMock')
#   # モックでupdateメソッドが利用できるように設定（戻り値 update）
#   # expectは呼び出しも検証
#   expect(update_mock).to receive(:update).and_return("update")
#   # allowは呼び出しは検証しない
#   allow(update_mock).to receive(:delete).and_return("delete")
#   # updateメソッドの戻り値をmockに置換
#   allow(users_controller).to receive(:update).and_return(update_mock.update)
#   # 検証
#   expect(users_controller.test).to eq "update"
# end
