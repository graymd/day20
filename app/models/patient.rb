class Patient < ActiveRecord::Base
  belongs_to :clinic
  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_many :doctors, as: :doctorable

  BLOOD_TYPE_OPTIONS = [
    ["O-", "O-"],
    ["O+", "O+"],
    ["A-", "A-"],
    ["A+", "A+"],
    ["B-", "B-"],
    ["B+", "B+"],
    ["AB-", "AB-"],
    ["AB+", "AB+"],
  ]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :blood_type, presence: true
  validate :at_least_10
  def at_least_10
    if self.date_of_birth
        errors.add(:date_of_birth, 'Error. Patient must be at least 10 years old') if self.date_of_birth > 10.years.ago.to_date  
    end
  end
end
