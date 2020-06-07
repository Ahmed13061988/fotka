class PhotosController < ApplicationController

    def new 
        @photo = Photo.new
        @user = User.new 
    end 

    def create
      @user = User.new 
      @photo = Photo.create(photo_params)
      session[:user_id] = @user.id 
      redirect_to photo_path(@photo) 
    end

   def show 
    @photo = Photo.find(params[:id])
     
   end 

    
 
    private  
    def photo_params 
        params.require(:photo).permit(:description, :user_id)
    end 
end
