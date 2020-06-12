class CommentsController < ApplicationController
    before_action :login_required

    def new
        
    #   binding.pry 
    #     if params[:user_id] && !Photo.exists?(params[:user_id])
    #         redirect_to photos_path, alert: "Photo not found"
    #       else
       @photo = Photo.find(params[:photo_id])
       @comment = Comment.new(photo_id: params[:photo_id])
        #   end 
    end

    def index
        if params[:photo_id]
          @photo = Photo.find_by(id: params[:photo_id])
          if @photo.nil?
            redirect_to photo_path, alert: "Photo not found"
          else
            @comments = @photo.comments
          end
        else
          @comments = Comment.all
        end
      end

    def create 
       
        # binding.pry
         @photo = Photo.find(params[:comment][:photo_id])
        #  binding.pry
         @comment = @photo.comments.build(comment_params)
         @comment.user_id = current_user.id
        if @comment.save
            redirect_to photo_comments_path(@photo)
        else 
            render :new 
        end 
    end



    def show 
        # binding.pry 
        @photo = Photo.find_by(params[:photo_id])
        # @user = @photo.user_id
        @comment = @photo.comments.find_by(id: params[:photo_id])  
    end 


        private 
        def comment_params
            params.require(:comment).permit(:content, :photo_id, :user_id)
        end 
end
