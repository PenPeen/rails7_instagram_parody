class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
        @post = Post.new
        @photos = @post.photos.build
    end

    def create
        # エラーメッセージ表示用
        @post = Post.new(post_params)
        @photos = @post.photos.build

        # validationエラー及び、画像が存在しているか。
        if @post.photos.present?
            if @post.save
                redirect_to root_path, flash: {notice: '投稿が保存されました'}
            end
        end

        @post.valid?
        flash[:alert] = "投稿に失敗しました"
        render :new, status: :unprocessable_entity
        
    end

    private
    def post_params
        params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
    end

end
