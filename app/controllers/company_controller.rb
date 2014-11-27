class CompanyController < ApplicationController

  def new
		@company = Company.new
  end


  def create
	@company = Company.new(company_params)
	if @company.save
    log_in @company
    flash.now[:success] = "Welcome to LinkMe"
    redirect_to new_job_path
	else
		render 'new' 
	end	
  end	


  private

	def company_params
		params.require(:company).permit(:name, :business, :email, :password, :password_confirmation)
	end		
end
