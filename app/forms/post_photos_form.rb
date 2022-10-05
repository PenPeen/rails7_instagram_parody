class PostPhotosForm
    include ActiveModel::Model      # モデルの機能を利用するために記載
    include ActiveModel::Attributes # モデルの機能を利用するために記載
    extend CarrierWave::Mount       # アップローダーの使用

    # 属性の定義（インスタンス作成時に値セット）
    attribute :caption, :string     # Post
    attribute :user_id, :integer    # Post
    attribute :image, :string       # Image

    # Carrier Wave アップローダー
    mount_uploader :image, ImageUploader

    # バリデーション
    validates :caption, presence: true
    validates :user_id, presence: true
    validates :image, presence: true

    # レコードの保存
    def save
        # バリデーションが発生している場合、Falseを返す。
        return false if invalid?

        # トランザクション処理
        ActiveRecord::Base.transaction do
            post = Post.create!(caption: caption, user_id: user_id)
            post.photos.build(image: image).save!
        end
    end

end
