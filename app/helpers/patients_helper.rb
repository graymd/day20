module PatientsHelper

def workflow_state_helper(patient)
  if patient.workflow_state == "waiting_room"
    "Patient is in waiting room."
  elsif patient.workflow_state == "doctor_checkup"
    "Patient is with the doctor."
  elsif patient.workflow_state == "xray"
    "Patient is in xray."
  elsif patient.workflow_state == "surgery"
    "Patient is in surgery."
  elsif patient.workflow_state == "pay_bill"
    "Patient is paying bill."
  elsif patient.workflow_state == "left"
    "Patient has left."
  end
end
