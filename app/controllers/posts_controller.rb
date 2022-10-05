class PostsController < ApplicationController
    before_action :authenticate_user!

    before_action :set_post, only: [:show, :destroy]

    def index
        # N+1問題の対策
        @posts = Post.limit(10).preload(:photos, :user).order('created_at DESC')
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
        else
            flash[:alert] = "投稿に失敗しました"
            render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def destroy
        if @post.user.id === current_user.id
            @post.destroy
            flash = {notice: '削除が完了しました'}
        else
            flash = {alert: '削除が失敗しました'}
        end
        redirect_to root_path, flash: flash, status: :see_other
    end

    private
    # PostPhotosForm ストロングパラメータ
    def post_photos_params
        params.require(:post_photos_form).permit(:caption, :image).merge(user_id: current_user.id)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
