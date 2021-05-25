class SessionsController < ApplicationController

    def create 
        if user = User.find_by(email: params[:email])
            user = User.find_by_email(params[:email])
        elsif params[:session_id] != "undefined" && User.find(params[:session_id].to_i)
            user = User.find(params[:session_id].to_i)
        end
        
        if user && user.authenticate(params[:password])
            # binding.pry
            library = Library.find_or_create_by(user_id: user.id)
            session[:user_id] = user.id
            render json: {
                id: user.id,
                status: 200,
                email: user.email,
                password: user.password,
                library: library.id
            }
        elsif user
            # binding.pry
            render json: {
                 status: 500,
                error: "Wrong Password"
            } 
        else
            # binding.pry
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
