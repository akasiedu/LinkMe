class ApplyController < ApplicationController
	def new
		@apply = Apply.new
	end

	def create
		
		@apply = Apply.new(apply_params)
		if @apply.save
			flash.now[:success] = "Application has been sent successfully"
			redirect_to jobs_path
		else
			flash.now[:danger] = "Email already exist for this job."
			render 'new'
		end
	end

	private

	def apply_params
		params.require(:apply).permit(:firstname, :lastname, :email, :phone_number, :level_of_education, :specialty, :resume)
	end		
end
