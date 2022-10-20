class Post < ApplicationRecord
    
    belongs_to :user

    has_many :photos, dependent: :destroy
    has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

    validates :caption, presence: true

    # user_idとpost_idが一致するlikeを検索する
    def liked_by(user)
        Like.find_by(user_id: user.id, post_id: id)
    end

    def already_liked?(like, user)
        like.pluck(:user_id).include?(user.id)
    end
    
    # 子レコードPhotoの保存及び、バリデーション有効
    # Formオブジェクトの実装に伴い、コメントアウト

    # accepts_nested_attributes_for :photos
    # validates_associated :photos
    # validates :photos, presence: true
end
