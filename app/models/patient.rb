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

  include Workflow
  workflow do
    state :waiting_room do
      event :to_doctor, transitions_to: :doctor_checkup
      event :to_xray, transitions_to: :xray
      event :to_surgery, transitions_to: :surgery
      event :leave, transitions_to: :left
    end
    
    state :doctor_checkup do
      event :to_xray, transitions_to: :xray
      event :to_surgery, transitions_to: :surgery
      event :to_pay_bill, transitions_to: :pay_bill
    end

    state :xray do
      event :to_doctor, transitions_to: :doctor_checkup
      event :to_surgery, transitions_to: :surgery
      event :to_pay_bill, transitions_to: :pay_bill
    end

    state :surgery do
      event :to_doctor, transitions_to: :doctor_checkup
      event :to_xray, transitions_to: :xray
      event :to_pay_bill, transitions_to: :pay_bill
    end

    state :pay_bill do
      event :leave, transitions_to: :left
    end

    state :left do
      event :wait, transitions_to: :waiting_room
    end
  end
end
