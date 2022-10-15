# # System Specs
# ## 統合テスト
# #### プロフィール画面に表示される項目が正しいか検証

# テスト時間短縮のため、コメントアウト
=begin
require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  describe "#show" do
    # let! exampleの実行前に値が作成
    let!(:create_user) {FactoryBot.create(:user)}

    context "自身のプロフィールページの場合" do
      it "プロフィール編集リンク、メールアドレスが表示されること" do
        sign_in create_user
        visit user_path(create_user)
        expect(page).to have_selector 'a', text: 'プロフィールを編集'
        expect(page).to have_selector 'p', text: create_user.email
      end
    end

    context "他人のプロフィールページの場合" do
      it "プロフィール編集リンク、メールアドレスが表示されないこと" do
        other_user = FactoryBot.create(:user)
        sign_in create_user
        visit user_path(other_user)
        expect(page).not_to have_selector 'a', text: 'プロフィールを編集'
        expect(page).not_to have_selector 'p', text: other_user.email
      end
    end

  end
    
end

=end
