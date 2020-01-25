class CreateReductions < ActiveRecord::Migration[6.0]
  def change
    create_table :reductions do |t|
      t.references :medication, null: false, foreign_key: true
      t.integer :days

      t.timestamps
    end
  end
end
