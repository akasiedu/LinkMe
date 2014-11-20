module SessionsHelper

	# Logs in the given company.
  def log_in(company)
    session[:company_id] = company.id
  end

   # Remembers a company in a persistent session.
  def remember(company)
    company.remember
    cookies.permanent.signed[:company_id] = company.id
    cookies.permanent[:remember_token] = company.remember_token
  end

  # Returns the company corresponding to the remember token cookie.
  def current_company
    if (company_id = session[:company_id])
      @current_company ||= Company.find_by(id: company_id)
    elsif (company_id = cookies.signed[:company_id])
      company = Company.find_by(id: company_id)
      if company && company.authenticated?(cookies[:remember_token])
        log_in company
        @current_company = company
      end
    end
  end


  # Returns true if the company is logged in, false otherwise.
  def logged_in?
    !current_company.nil?
  end

   # Forgets a persistent session.
  def forget(company)
    company.forget
    cookies.delete(:company_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current company.
  def log_out
    session.delete(:company_id)
    @current_company = nil
  end
end
