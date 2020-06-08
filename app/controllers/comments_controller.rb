class CommentsController < ApplicationController
    before_action :login_required

    def new
        @comment = Comment.new
        @comment.user_id = params[:user_id]
        user_photos
    end

    def index 
        @comments = Comment.all 
    end 

    
    def create
        @comment = current_user.comments.build(photo_params)
        # @user = User.find_by(id: photo_params[:user_id])
        @user = User.find_by(params[:user_id])
        @comment.user_id = @user.id
        current_user = @user.id
        if @comment.save
            redirect_to comment_path(@comment)
        else
            render :new
        end
    end



    def show 
        @comment = Comment.find_by_id(params[:id])
    end 

        private 
        def comment_params
            params.require(:comment).permit(:content)
        end 
end
