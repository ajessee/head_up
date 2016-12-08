class LeadsController < ApplicationController
  before_action :logged_in_user,  only: [:index, :destroy]
  before_action :admin_user,      only: :destroy

  def show
    @lead = Lead.find(params[:id])  
  end

  def index
    @leads = Lead.paginate(page: params[:page], per_page: 4)
  end

  def create
    @lead = Lead.new(user_params)
    if @lead.save
      flash[:success] = "Thanks for reaching out! We'll be contacting you shortly."
        if Rails.env.production?
          MyMailer.send_new_lead_email(user_params).deliver
        end
      redirect_to '/#flash'
    else
      render 'oldLeadForm'
    end
  end

  def destroy
    Lead.find(params[:id]).destroy
    flash[:success] = "Lead deleted"
    redirect_to '/leads'
  end

  private

    def user_params
      params.require(:lead).permit(:name, :email, :phone,
                                   :message)
    end
end
