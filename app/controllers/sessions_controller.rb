class SessionsController < ApplicationController
    
    def new 
    end 
     
    def home
    end

    

    def create
        if
              @user = User.find_by(email: params[:user][:email])
            @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                @photo = Photo.find_by(id: params[:user_id])
                @photo = @user.id
                redirect_to user_path(@user)
            else
                redirect_to "/login"
        end
    end


    def google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.email = auth["info"]["first_name"]
            user.password = SecureRandom.hex    
        end

        if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end


    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end
