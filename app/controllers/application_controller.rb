class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :new_lead, :new_lead?, :pass_lead

  def new_lead
    @lead = Lead.new
  end

  def new_lead?(lead)
    if @lead == nil
      new_lead
      true
    else
      false
    end
  end

end
