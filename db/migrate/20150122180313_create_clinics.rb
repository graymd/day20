class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :st_address
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
