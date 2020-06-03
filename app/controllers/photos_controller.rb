class PhotosController < ApplicationController


 

    
 
    private  
    def photo_params 
        params.require(:user).permit(:description)
    end 
end
