# ユーザー
puts "seed User"

10.times do |n|
    User.create!([
        name: "test_user#{n}",
        email: "test#{n}@test.com", 
        password: '12345678',
    ])
end

# 投稿
puts "seed Post"
User.find(1).posts.create!([
    {
        caption: "美味しそうなリンゴ！"
    },
    {
        caption: "旅行に行きました。"
    },
])

User.find(3).posts.create!([
    {
        caption: "かわいい"
    },
])

User.find(4).posts.create!([
    {
        caption: "おしゃれな絵画がありました。"
    },
])


# 写真
puts "seed Photo"
Post.find(1).photos.create!(
    image: File.open("#{Rails.root}/app/assets/images/demo-1.jpg")
)
Post.find(2).photos.create!(
    image: File.open("#{Rails.root}/app/assets/images/demo-2.jpg")
)
Post.find(3).photos.create!(
    image: File.open("#{Rails.root}/app/assets/images/demo-3.jpg")
)
Post.find(4).photos.create!(
    image: File.open("#{Rails.root}/app/assets/images/demo-4.jpg")
)


# いいね
puts "seed Like"
User.find(3).likes.create!(post: Post.find(1))
User.find(4).likes.create!(post: Post.find(1))
User.find(5).likes.create!(post: Post.find(1))
User.find(6).likes.create!(post: Post.find(1))
User.find(7).likes.create!(post: Post.find(1))

User.find(3).likes.create!(post: Post.find(2))
User.find(4).likes.create!(post: Post.find(2))

User.find(5).likes.create!(post: Post.find(3))
User.find(7).likes.create!(post: Post.find(3))

User.find(1).likes.create!(post: Post.find(4))
