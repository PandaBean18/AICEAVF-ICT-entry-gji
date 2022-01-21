class PsychiatristsController < ApplicationController

    def create 
        attributes = psychiatrist_params
        begin
            psychiatrist = Psychiatrist.create!(attributes)
        rescue
            render json: Psychiatrist.create!(attributes).errors.full_messages, status: :unprocessable_entity
        else 
            render json: psychiatrist
        end
    end

    def show 
        id = params[:id]
        @psychiatrist = Psychiatrist.find_by(id: id)
        if @psychiatrist
            render :show
        else
            render json: {}, status: :not_found
        end
    end

    def find_potential_patients
        psychiatrist_id = params[:id]
        @users = Psychiatrist.find(psychiatrist_id).users_near_psychiatrist
        render json: @users
    end

    private
     
    def psychiatrist_params 
        parameters =  params.require(:psychiatrists).permit(:name, :email, :reigion)
        return parameters
    end
end