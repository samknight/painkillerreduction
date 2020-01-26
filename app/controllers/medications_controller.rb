class MedicationsController < ApplicationController

    def new
        @drugs = Drug.all
        @patient = params[:patient_id].nil? ?  Patient.create! : Patient.find(params[:patient_id])
        @medication = Medication.new
    end

    def create
        @drugs = Drug.all
        @medication = Medication.new(medication_params)
        @patient = @medication.patient

        if @medication.save
          if @medication.add_another == '1'
            redirect_to new_medication_path(patient_id: @patient.id)
          else
            redirect_to new_patient_reduction_path(@patient)
          end
        else
          render :new
        end
    end


    def medication_params
        params.require(:medication).permit(:drug_id, :patient_id, :dose, :frequency, :add_another)
    end
end
