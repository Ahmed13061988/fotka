class CommentsController < ApplicationController

    def new
        
        @comment = Comment.new  
    end 

    def index 
     
        @comments = Comment.all 
    end 

    def create 
      
        @comment = Comment.create(comment_params)
      
        redirect_to comments_path(@comment)
    end 

    def show 
        @comment = Comment.find_by_id(params[:id])
    end 

        private 
        def comment_params
            params.require(:comment).permit(:content)
        end 
end
