class Post < ApplicationRecord
    belongs_to :user

    has_many :photos, dependent: :destroy
    has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
    
    validates :caption, presence: true
    
    # 子レコードPhotoの保存及び、バリデーション有効
    # Formオブジェクトの実装に伴い、コメントアウト

    # accepts_nested_attributes_for :photos
    # validates_associated :photos
    # validates :photos, presence: true
end
