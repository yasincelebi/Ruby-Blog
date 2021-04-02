module Readers
    class PostsController < ReadersController
        def show
            @posts = Post.friendly.find(params[:id])
        end
    end
end