class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :company
      t.string :adverse_reactions
      t.boolean :generic_option

      t.timestamps null: false
    end
  end
end
