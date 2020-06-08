module ApplicationHelper
    def current_user 
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
     end

    def is_logged_in?
        !!session[:user_id]
    end

    def login_required
        unless is_logged_in?
            redirect_to login_path
        end
    end

    def user_photos
        current_user.photos 
    end


    def redirect_if_not_logged_in
        redirect_to '/' if !is_logged_in?
      end 
end
