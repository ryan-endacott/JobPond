class ResumesController < ApplicationController
  authorize_resource :resume
  before_filter :employee_only!

  # GET /resumes/1/edit
  def edit
    @resume = resume
    @resume.job_experiences.build unless !@resume.job_experiences.empty?
  end

  # PUT /resumes/1
  # PUT /resumes/1.json
  def update
    @resume = resume
    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to root_path, notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def resume
      return @resume || current_user.resume || current_user.build_resume
    end
end
