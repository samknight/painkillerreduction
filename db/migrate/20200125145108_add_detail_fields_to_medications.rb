class AddDetailFieldsToMedications < ActiveRecord::Migration[6.0]
  def change
    add_column :medications, :dose, :integer
    add_column :medications, :frequency, :integer
  end
end
