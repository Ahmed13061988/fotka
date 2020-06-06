class PhotosController < ApplicationController

    def new 
        @photo = Photo.new
    end 

   def create
    @user = User.new 
    @photo = Photo.new(photo_params)
    @photo.save 
    session[:user_id] = @user.id 
    # redirect_to user_path(@user)
    redirect_to photo_path(@photo)
   end 

   def show 
    @photo = Photo.find(params[:id])
    @user = @photo.build(user_id: current_user.id)
   end 
 

    
 
    private  
    def photo_params 
        params.require(:photo).permit(:description)
    end 
end
