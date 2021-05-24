class SessionsController < ApplicationController

    def create 
        user = User.find_by_email(params[:email])
        library = Library.find_or_create_by(user_id: user.id)
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: {
                id: user.id,
                status: 200,
                email: user.email,
                password: user.password,
                library: library.id
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

    def index
        
    end

    def destroy
        session.delete :user_id
        render json:{
            logged_in: false,
            user: ''
    }
    end
end
