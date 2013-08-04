class Admin::StatsController < ApplicationController
	def index
		@user_count = User.count
		@employee_count = Employee.count
		@employer_count = Employer.count
		@admin_count = Admin.count
		@job_count = Job.count
		@contact_purchase_count = ContactPurchase.count
	end
end
