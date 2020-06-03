class UsersController < ApplicationController
skip_before_action :verified_user, only: [:new, :create]
  
    def new 
    
        @user = User.new(@user_params)
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
        @user = User.find(params[:id])
    end 


    def edit 
        @user = User.find_by(params[:id])
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

    def current_user
        @user = (User.find(session[:user_id]) || User.new)
      end
     
    private  
    def user_params 
        params.require(:user).permit(:email, :password, :image)
    end 
end
