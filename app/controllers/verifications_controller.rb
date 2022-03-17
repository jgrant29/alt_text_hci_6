class VerificationsController < ApplicationController
     before_action :set_alt, only: %i[ edit update destroy create]
    def create
        @verifcation = current_user.verifcations.new(verifcation_params)
        if !@verifcation.save
            flash[:notice] = @verification.errors.full_messages.to_sentence
        end
    end

    def destroy
        @verifcation = current_user.like.find(params[:id])
        alt = @verifcation.alt
        @verifcation.destroy
    end

    private

    def verifcation_params
        params.require(:verifcation).permit(:alt_id)
    end
end
