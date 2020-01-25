class MedicationsController < ApplicationController

    def new
        @drugs = Drug.all
        @patient = Patient.create!
        @medication = Medication.new
    end

    def create
        @medication = Medication.new(medication_params)
        @medication.save

        redirect_to new_medication_reduction_path(@medication)
    end


    def medication_params
        params.require(:medication).permit(:drug_id, :patient_id, :dose, :frequency)
    end
end
