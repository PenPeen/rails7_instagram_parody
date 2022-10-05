FactoryBot.define do
  factory :photo do
    image { File.new("#{Rails.root}/app/assets/images/no_image.jpg") }
    association :post
  end
end
