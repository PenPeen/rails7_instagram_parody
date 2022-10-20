class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @like = current_user.likes.build(like_params)
        @post = @like.post
        @like.save!
        render @post
    end

    def destroy
        @like = Like.find_by(user_id: current_user.id, post_id: params[:id])
        @post = @like.post
        @like.destroy
        redirect_to root_path
    end

    private
    def like_params
        params.permit(:post_id)
    end
end
