class Photo < ApplicationRecord
    belongs_to :post

    validates :image, presence: true

    # アップローダーのマウント
    mount_uploader :image, ImageUploader
end
