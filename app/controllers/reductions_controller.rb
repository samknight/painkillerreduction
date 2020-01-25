class ReductionsController < ApplicationController

    def new
        @medication = Medication.find(params[:medication_id])
        @reduction = @medication.reduction.new
    end

    def create
        @medication = Medication.find(params[:medication_id])
        @reduction = @medication.reduction.new(reduction_params)
        @reduction.save
        redirect_to [@medication, @reduction]
    end

    def show
        @medication = Medication.find(params[:medication_id])
        @reduction = Reduction.find(params[:id])
    end


    def reduction_params
        params.require(:reduction).permit(:days)
    end
end
