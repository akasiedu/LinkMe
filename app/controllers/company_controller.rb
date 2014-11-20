class CompanyController < ApplicationController
  def show
  	@company = Company.find(params[:id])
  end

  def new
  	@company = Company.new
  end

  def create
  	@company = Company.new(company_params)
  	if @company.save
      log_in @company
  		flash[:success] = "Welcome to LinkMe!"
  		redirect_to '/jobs/new'
  	else
  		render 'new'
  	end
  end

  private

  def company_params
  	params.require(:company).permit(:name, :business, :email, :password, :email_confirmation )
  end
end
