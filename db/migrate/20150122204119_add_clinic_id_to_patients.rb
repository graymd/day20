class AddClinicIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :clinic_id, :integer
  end
end
