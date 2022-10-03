require 'rails_helper'

# ユーザーモデルに関するテスト
RSpec.describe User, type: :model do
  describe "アカウント作成" do

    # インスタンス変数
    let(:user) {FactoryBot.build(:user)}
    let(:create_user) {FactoryBot.create(:user)}

    it "アカウントが作成できること" do
      expect {create_user}.to change{User.count}.by(1)
    end

    describe "ユーザー名" do
      context "ユーザー名が入力されている場合" do
        it "アカウント作成ができること" do
          expect(user.valid?).to be_truthy
        end
      end

      context "ユーザー名が入力されていない場合" do
        it "アカウント作成ができないこと" do
          user.name =""
          expect(user.valid?).to be_falsey
        end
      end

      context "ユーザー名が50文字以内の場合" do
        it "アカウント作成ができること" do
          user.name = "Alice"
          expect(user.valid?).to be_truthy
        end
      end

      context "ユーザー名が50文字以上の場合" do
        it "アカウント作成ができないこと" do
          # 51文字
          user.name = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXY"
          expect(user.valid?).to be_falsey
        end
      end
    end

    describe "メールアドレス" do
      context "メールアドレスが入力されていない場合" do
        it "アカウント作成ができないこと" do
          user.email =""
          expect(user.valid?).to be_falsey
        end
      end
    end

  end
end
