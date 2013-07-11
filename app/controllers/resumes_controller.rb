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
    unless current_user.valid_password?(params[:resume][:password])
      flash[:error] = "You need to enter your password to verify changes!"
      clean_password
      @resume.attributes = params[:resume]
      render "edit"
      return
    end
    clean_password
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

    def clean_password
      params[:resume].delete :password
    end
end
