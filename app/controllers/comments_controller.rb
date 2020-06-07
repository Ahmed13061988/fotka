class CommentsController < ApplicationController

    def new
        @comment = Comment.new  
    end 

    def create 
        @comment = Comment.create(comment_params)
        
            redirect_to comment_path(@comment)
        
    end 

        private 
        def comment_params
            params.require(:comment).permit(:content)
        end 
end
