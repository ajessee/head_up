class LeadsController < ApplicationController

  def show
    @lead = Lead.find(params[:id])  
  end

  def create
    @lead = Lead.new(user_params)
    if @lead.save
      flash[:success] = "Thanks for reaching out! We'll be contacting you shortly."
        MyMailer.send_new_lead_email(user_params).deliver
      redirect_to '/#flash'
    else
      render 'oldLeadForm'
    end
  end

  private

    def user_params
      params.require(:lead).permit(:name, :email, :phone,
                                   :message)
    end
end
