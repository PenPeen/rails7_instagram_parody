require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  describe "#show" do
    
    context "自身のプロフィールページの場合" do
      let(:create_user) {FactoryBot.create(:user)}
      it "プロフィール編集画面が表示されること" do
        sign_in create_user
        visit user_path(create_user)
        expect(2).to eq 2
      end

      it "メールアドレスが表示されること" do
        skip "Skip"
      end
    end

  end
    
end
