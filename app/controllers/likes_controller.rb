class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        # like = Like.find_or_initialize_by(likes_params).merge(user_id: current_user.id)
        # if likes.new_record?
        #     like.save!
        # end
        # redirect_to root_path, flash:{notice: 'いいねした'}

        @like = current_user.likes.build(like_params)
        @post = @like.post
        if @like.save!
            respond_to {render 'likes/create.js.erb'}
        end

    end

    def destroy
        @like = Like.find_by(id: params[:id])
        @post = @like.post
        if @like.destroy
            respond_to :js
        end
    end

    private
    def like_params
        params.permit(:post_id)
    end
end
