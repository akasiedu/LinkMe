class ApplyController < ApplicationController

	def new
		@apply = Apply.new(company_id: params[:company])
	end

	def create
		
		@apply = Apply.new(apply_params)
		if @apply.save
			flash.now[:success] = "Application has been sent successfully"
			redirect_to jobs_path
		else
			# flash.now[:danger] = "Email already exist for this job."
			render 'new'
		end
	end

	private

	def apply_params
		params.require(:apply).permit(:firstname, :lastname, :email, :phone_number, :level_of_education, :specialty, :resume, :company_id)
	end	


   def logged_in_company
     unless logged_in?
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end


end
