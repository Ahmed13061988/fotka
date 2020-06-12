class PhotosController < ApplicationController

    def new 
        @photo = Photo.new(user_id: params[:user_id])
    end 

    def index 
        @user = User.find(params[:user_id])
        @photos = @user.photos 
    end 

    def create
        @photo = current_user.photos.build(photo_params)
        # @user = User.find_by(id: photo_params[:user_id])
        @user = User.find_by(params[:user_id])
        @photo.user_id = @user.id
        current_user = @user.id
        if @photo.save
            redirect_to photo_path(@photo)
        else
            render :new
        end
    end

   def show 
    #  binding.pry 
     @user = User.find(params[:id])
     @photo = Photo.find_by(user_id: params[:user_id])     
     
   end 

    
 
    private  
    def photo_params 
        params.require(:photo).permit(:description,
             :user_id,
             comment_attributes: [:content]
            )
    end 
end
