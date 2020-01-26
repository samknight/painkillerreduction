class AddPatientToReductions < ActiveRecord::Migration[6.0]
  def change
    add_reference :reductions, :patient, null: false, foreign_key: true
  end
end
