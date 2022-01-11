class UsersController < ApplicationController
    def create 
        attributes = user_params
        begin   
            user = User.create!(attributes)
        rescue 
            render json: User.create!(attributes).errors.full_messages, status: :unprocessable_entity
        else 
            render json: user 
        end 
    end

    def show 
        id = params[:id]
        user = User.find(id)
        if user 
            render json: user 
        else 
            render json: {}, status: :not_found
        end
    end

    private

    def user_params 
        parameters = params.require(:users).permit(:username, :email, :reigion)
        return parameters
    end
end