module LeadsHelper

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
