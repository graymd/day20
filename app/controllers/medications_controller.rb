class MedicationsController < ApplicationController

  def index
    @medications = Medication.all
  end

  def show
    @medication = Medication.find params[:id]
    @patients = @medication.patients
  end

    # @clinic = Clinic.find params[:clinic_id]
    # @patient = @clinic.patients.find params[:patient_id]
    # @medication = @patient.medications.new


  def new
    @medication = Medication.new
    @patients = Patient.all
  end

  def create
    @medication = Medication.create medication_params
    redirect_to medications_path
  end

  def edit
    @medication = Medication.find params[:id]
    @patients = Patient.all
  end

  def update
    @medication = Medication.find params[:id]
    @medication.update medication_params
    redirect_to medications_path
  end

  def destroy
    @medication = Medication.find params[:id]
    @medication.delete
    redirect_to medications_path
  end


private
  def medication_params
    params.require(:medication).permit(
      :name,
      :company,
      :adverse_reactions,
      :generic_option,
      patient_ids: []
      )
  end

  def set_patient
    @patient = Patient.find params[:id]
  end

end
