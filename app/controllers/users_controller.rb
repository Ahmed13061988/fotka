class UsersController < ApplicationController

  
    def new 
        @user = User.new
    end 

    def index
        @users = User.all
    end 


    def create
       @user = User.new(user_params)
       if @user.valid?
        @user.save
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
       else 
        render :new 
       end 
     end
    
   
    
    def show
        @photo = Photo.new 
        @user = User.find(params[:id])
    end 
    


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
        params.require(:user).permit(:email, :password, :image)
    end 
end
