module ApplicationHelper

    # check if the user is signed in
    def signed_in?
        !!session[:user_id]
    end 

    # assign the current user
    def current_user

        # check and assign
        if !!session[:user_id] then
            @current_user ||= User.find_by_id(session[:user_id]) 
        end
    end
end
