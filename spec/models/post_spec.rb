require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "バリデーション" do

    it "Captionが空欄の時に保存ができないこと" do
      post = FactoryBot.build(:post, caption: nil)
      expect(post.valid?).to be_falsey
    end

  end

  describe "アソシエーション" do
    it "記事を削除したら、関連する写真データも削除されること" do
      post = FactoryBot.create(:post)
            
      FactoryBot.create(:photo, post: post)
      FactoryBot.create(:photo, post: post)
      FactoryBot.create(:photo, post: post)

      expect{post.destroy}.to change{Photo.count}.by(-3)
    end
  end
end
