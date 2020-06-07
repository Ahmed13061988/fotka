class PhotosController < ApplicationController

    def new 
        @photo = Photo.new
    end 

    def index 
        @photos = Photo.all 
    end 

    def create
       
      @photo = Photo.create(photo_params)
       
      redirect_to photos_path(@photo) 
    end

   def show 
    @photo = Photo.find(params[:id])     
   end 

    
 
    private  
    def photo_params 
        params.require(:photo).permit(:description, :user_id)
    end 
end
