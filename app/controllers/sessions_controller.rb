class SessionsController < ApplicationController
    
    def new 
        @user = User.new 
    end 

    

    def error  
     render :new
    end 

    def create
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password] )
          #logging in 
          session[:user_id] = @user.id
          
          redirect_to user_path(@user) #show page
      else 
          render :new
      end 
      
  end 
  

      def destroy
        session.clear 
        redirect_to signup_path
      end

    
end
