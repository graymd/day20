class CreatePatientMedications < ActiveRecord::Migration
  def change
    create_table :patient_medications do |t|
      t.integer :patient_id
      t.integer :medication_id
      t.timestamps null: false
    end
  end
end
