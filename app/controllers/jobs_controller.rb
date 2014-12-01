class JobsController < ApplicationController
	before_action :logged_in_company, except: [:index, :show]


	def new
		@job = Job.new(company_id: params[:company])
	end

	def index
		@jobs = Job.all
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to @job
		else
			render 'new'
		end
	end

	def edit
		@job = Job.find(params[:id])
	end

	def show
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		if @job.update(job_params)
			redirect_to @job
		else
			render 'edit'
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_path
	end

	private
	 
   def job_params
		params.require(:job).permit(:company_name, :company_logo, :job_description, :company_id)
	 end

   def logged_in_company
     unless logged_in?
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end

   
end