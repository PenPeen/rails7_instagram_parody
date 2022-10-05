class Like < ApplicationRecord

    belongs_to :user
    belings_to :post

    # ユーザーが作成できるいいね数を制限
    validates :user_id, uniqueness: { scope: :post_id }
end
