require 'rails_helper'

RSpec.describe Photo, type: :model do

  describe "バリデーション関連" do

    it "画像が必須であること" do
      photo = FactoryBot.build(:photo, image: nil)
      expect(photo).not_to be_valid 
    end
  
  end

  describe "画像アップロード関連" do
    it "画像が正しくアップロードできること" do
      image = FactoryBot.create(:photo)
      expect(image).to be_valid
    end
  end
end
