class SessionsController < ApplicationController
    
    def new 
        @user = User.new 
    end 

    def current_user
      @user = (User.find_by(id: session[:user_id]) || User.new)
    end
    

    def error  
     render :new
    end 

    # def create
    #   @user = User.find_by(email: params[:user][:email])
    #   if @user && @user.authenticate(password: params[:user][:password] )
    #       #logging in 
    #       sessions[:user_id] = @user.id
    #       @user = User.find(session[:user_id])
    #       redirect_to user_path(@user) #show page
    #   else 
    #       render :new
    #   end 
      
  # end 

    def create
        user = User.find_by(email: params[:user][:email])
    
        user = user.try(:authenticate, params[:user][:password])

        
        return redirect_to(controller: 'sessions', action: 'error') unless user
    
        session[:user_id] = user.id
    
        @user = User.find(session[:user_id])

        redirect_to user_path(@user)
        
      end

  

      def destroy
        session.delete :user_id
        redirect_to signup_path(@user)
      end

    
end
