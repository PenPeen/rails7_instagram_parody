class Photo < ApplicationRecord
    belongs_to :post
    # validates :image, presence: true

    # アップロードツールを「Carrier Wave」から、「ActiveStorage」に変更
    has_one_attached :image
    # mount_uploader :image, ImageUploader    #アップローダー
end
