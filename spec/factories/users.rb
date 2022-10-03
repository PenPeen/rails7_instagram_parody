# Factory Bot
# ユーザーのテストデータを作成
FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    sequence :email do |n|
      "test_user#{n}@test.co.jp"
    end
    password { "12345678" }
  end
end
