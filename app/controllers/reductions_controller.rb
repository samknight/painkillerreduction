class ReductionsController < ApplicationController

    def new
        @patient = Patient.find(params[:patient_id])
        @reduction = @patient.reductions.new
    end

    def create
        @patient = Patient.find(params[:patient_id])
        @reduction = @patient.reductions.new(reduction_params)
        @reduction.save
        redirect_to patient_reduction_path(@patient, @reduction)
    end

    def show
        @patient = Patient.find(params[:patient_id])
        @reduction = Reduction.find(params[:id])
        @medication = @reduction.medication
    end


    def reduction_params
        params.require(:reduction).permit(:medication_id, :days)
    end
end
