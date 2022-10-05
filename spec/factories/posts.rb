FactoryBot.define do
  factory :post do
    caption {"テスト記事"}
    association :user
  end
end
