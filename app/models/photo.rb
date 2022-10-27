class Photo < ApplicationRecord
    belongs_to :post
    # validates :image, presence: true

    # アップロードツールを「Carrier Wave」
    mount_uploader :image, ImageUploader    #アップローダー

    # ActiveStorage Formオブジェクトでは利用できなかった。。。
    # has_one_attached :image
end
