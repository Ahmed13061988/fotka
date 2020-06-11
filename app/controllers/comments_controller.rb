class CommentsController < ApplicationController
    before_action :login_required

    def new
       @photo = Photo.find_by(params[:user_id])
       @comment = Comment.new(photo_id: params[:photo_id])
    end

   

    
    def create
        
         @photo = Photo.find_by(params[:user_id])
         @comment = @photo.comments.new(comment_params)
        #  @comment.user_id = @photo.user_id
         @comment.user_id = current_user.id
         @comment.photo_id = params[:photo_id]

        if @comment.save
            redirect_to photo_comment_path(@photo, @comment)
        else 
            render :new 
        end 
    end



    def show 
        @photo = Photo.find_by(params[:photo_id])
        @user = @photo.user_id
        @comment = @photo.comments.find_by(params[:photo_id])  
    end 


        private 
        def comment_params
            params.require(:comment).permit(:content, :user_id, :photo_id)
        end 
end
