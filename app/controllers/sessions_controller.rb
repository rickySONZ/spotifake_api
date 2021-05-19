class SessionsController < ApplicationController

    def create 
        user = User.find_by_email(params[:email])
       
        if user && user.authenticate(params[:password])
            sessions[:user_id] = user.id
            render json:{
                status: 200,
                user: user.json()
            }
        elsif user
            render json: {
                 status: 500,
                error: "Wrong Password"
            } 
        else
             render json: {
                 status: 500,
                 error: "Email Not Found"
             }
        end
    end

    def logged_in
        if @current_user
            render json:{
                logged_in: true,
                user: @current_user
            }
        else
            render json:{
                logged_in: false
            }
        end
    end
    def logout
        reset_session
        render json: {status: 200, logged_out: true}
    end

    
end
