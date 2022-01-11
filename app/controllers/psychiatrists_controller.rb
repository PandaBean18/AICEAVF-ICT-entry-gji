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
        psychiatrist = Psychiatrist.find(id)
        if psychiatrist
            render json: psychiatrist
        else
            render json: {}, status: :not_found
        end
    end

    private
     
    def psychiatrist_params 
        parameters =  params.require(:psychiatrists).permit(:name, :email, :reigion)
        return parameters
    end
end