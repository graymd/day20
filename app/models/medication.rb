class Medication < ActiveRecord::Base
  has_many :patient_medications
  has_many :patients, through: :patient_medications
end
