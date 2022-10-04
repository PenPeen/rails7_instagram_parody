class Post < ApplicationRecord
    belongs_to :user
    has_many :photos, dependent: :destroy

    accepts_nested_attributes_for :photos

    validates :caption, presence: true

    # photos（子レコードのバリデーションも有効とする）
    validates_associated :photos
    validates :photos, presence: true
end
