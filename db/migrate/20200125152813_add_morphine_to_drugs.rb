class AddMorphineToDrugs < ActiveRecord::Migration[6.0]
  def change
    add_column :drugs, :morphine, :decimal
  end
end
