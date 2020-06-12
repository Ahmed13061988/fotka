class UsersController < ApplicationController


    def new 
        @photo = Photo.new 
        @user = User.new
        @user.photos.build 
    end 

    def index
        @users = User.all.order("created_at DESC")
    end 


    def create
       @user = User.new(user_params)
       if @user.valid?
        @user.save
        session[:user_id] = @user.id 
         @user.photos.build(photo_params)
        redirect_to @user 
       else 
        render :new 
       end 
     end
    
   
    
    def show
        @comment = Comment.find(params[:id]) 
        @user = User.find(params[:id]) 
        @photo = Photo.find(params[:id])
        
    end 
    

    # def view
    #     @comment = Comment.find_by(id: params[:id])  
    #     @photo = Photo.new 
    #     @user = User.find(params[:id]) 
    #     redirect_to user_photo_path(@user)
    # end 


    def edit 
        @user = User.find(params[:id])
    end 
    
    def update
     @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to user_path(@user)
    end 

    def destroy 
       User.find(params[:id]).destroy
       redirect_to signup_path
    end 

    
     
    private  

   
    def user_params 
        params.require(:user).permit(:email,
            :password,
            :image,
             photos_attributes: [:description, :user_id],
             comment_attributes: [:content]
         )
    end 
end