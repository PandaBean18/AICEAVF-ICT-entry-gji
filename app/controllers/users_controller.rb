class UsersController < ApplicationController
    def create 
        @user = User.new(user_params)
        if @user.save 
            redirect_to user_url(@user)
        else 
            render :new 
        end
    end

    def index 
        render :index 
    end

    def show 
        id = params[:id]
        @user = User.find(id)
        if @user 
            render :show 
        else 
            render json: {}, status: :not_found
        end
    end

    def new 
        render :new
    end

    def find_help 
        user_id = params[:id]
        @psychiatrists = User.find(user_id).psychiatrists_near_user
        if @psychiatrists.length > 0 
            render :findhelp
        else 
            render json: "Uh oh! Looks like there are no psychiatrists near you!"
        end
    end

    def login 
        username = user_params[:username]
        user_id = User.find_by(username: username).id
        redirect_to user_url(user_id)
    end

    private

    def user_params 
        parameters = params.require(:users).permit(:username, :email, :reigion)
        return parameters
    end
end