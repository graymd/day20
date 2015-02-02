class Doctor < ActiveRecord::Base
  belongs_to :doctorable, polymorphic: true
end
