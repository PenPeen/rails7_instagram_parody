require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "バリデーション検証" do
    before do
      @post = FactoryBot.build(:post)
    end

    it "captionが空欄でない場合は、保存できること" do
      expect(@post).to be_valid
    end

    it "Captionが空欄の場合は、保存ができないこと" do
      @post.caption = nil
      expect(@post).to be_invalid
    end
  end

  describe "アソシエーション" do
    before do
      @post = FactoryBot.create(:post)
    end

    it "記事を削除したら、関連する写真データも削除されること" do
      FactoryBot.create(:photo, post: @post)
      FactoryBot.create(:photo, post: @post)
      FactoryBot.create(:photo, post: @post)

      expect{@post.destroy}.to change{Photo.count}.by(-3)
    end

    it "記事を削除したら関連するいいねも削除されること" do
      user_first = FactoryBot.create(:user)
      user_second = FactoryBot.create(:user)
      user_third = FactoryBot.create(:user)

      Like.create(post: @post, user: user_first)
      Like.create(post: @post, user: user_second)
      Like.create(post: @post, user: user_third)

      expect{@post.destroy}.to change(Like, :count).by(-3)
    end

  end

  describe "インスタンスメソッド" do

    describe "#liked_by" do
      before do
        @post = FactoryBot.create(:post)
        @user = FactoryBot.create(:user)
      end

      it "ユーザーに関連する「Like」が検索できること" do
        post = @user.posts.create(caption: 'New Post')
        like = post.likes.create(user: @user)

        expect(post.liked_by(@user)).to eq like
      end
    end
  end

end
