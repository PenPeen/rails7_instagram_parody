class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        # N+1問題の対策
        @posts = Post.limit(10).preload(:photos).order('created_at DESC')
    end

    # 記事の作成画面
    def new
        @post_photos = PostPhotosForm.new
    end

    # 記事作成処理
    def create
        @post_photos = PostPhotosForm.new(post_photos_params)

        if @post_photos.save
            redirect_to root_path, flash: {notice: '投稿が保存されました'}

            # 完了メールの送信
            PostMailer.send_when_posts(current_user).deliver
        else
            flash[:alert] = "投稿に失敗しました"
            render :new, status: :unprocessable_entity
        end
    end

    private
    # PostPhotosForm ストロングパラメータ
    def post_photos_params
        params.require(:post_photos_form).permit(:caption, :image).merge(user_id: current_user.id)
    end
end
