class CommentsController < ApplicationController
    before_action :login_required

    def new
        @comment = Comment.new
        @photo = Photo.new 
        @comment.photo_id = params[:photo_id]
        
    end

    def index 
        @photo = Photo.find_by(params[:photo_id])
        @comment = @photo.comments 
    end 

    
    def create
        #  binding.pry 
        @user = User.find_by(params[:user_id])
        @photo= Photo.find_by(params[:photo_id])
        @comment = @photo.comments.build(comment_params)
        @comment.photo_id = @photo.id 
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to comment_path(@comment)
        else
            render :new
        end
    end



    def show 
        @user = User.find_by(params[:user_id])
        @photo = Photo.find_by(params[:photo_id])
        @comment = @user.comments.find_by(params[:user_id])
    end 

        private 
        def comment_params
            params.require(:comment).permit(:content, 
                    :photo_id, 
                    :user_id
                )
        end 
end
