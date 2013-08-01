class Employees::AppliedsController < ApplicationController
  # POST /applieds
  # POST /applieds.json
  def create
    params[:applied][:employee_id] = current_user.id if current_user.employee?
    @applied = Applied.new(params[:applied])

    respond_to do |format|
      if @applied.save
        format.html { render json: @applied, status: :created }
        format.json { render json: @applied, status: :created }
      else
        format.html { render json: @applied.errors, status: :unprocessable_entity }
        format.json { render json: @applied.errors, status: :unprocessable_entity }
      end
    end
  end

end
