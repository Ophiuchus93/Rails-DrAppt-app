class ApptsController < ApplicationController
  before_action :set_doctor

  def index
    @appt = @doctor.appts.all
  end
  
  def show
  end
  
  def new
    @appt = @doctor.appts.new
  end

  def create
    @appt = @doctor.appts.new(appt_params)
    if appt.save
      redirect_to doctor_appts_path(@doctor)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @appt = @doctor.appts.find(params[:id])
    @appt.destroy
    redirect_to doctor_appts_path(@doctor)
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appt_params
      params.require(:appt).permit(:time, :user_id)
    end
end
