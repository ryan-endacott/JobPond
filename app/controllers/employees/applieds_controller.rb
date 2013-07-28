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

  # DELETE /applieds/1
  # DELETE /applieds/1.json
  def destroy
    @applied = Applied.find(params[:id])
    @applied.destroy

    respond_to do |format|
      format.html { redirect_to applieds_url }
      format.json { head :no_content }
    end
  end
end
