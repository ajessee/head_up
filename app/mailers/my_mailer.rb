class MyMailer < ApplicationMailer

  def send_new_lead_email(options={})
    @name = options[:name]
    @email = options[:email]
    @phone = options[:phone]
    @message = options[:message]
    mail(:to=>"stephaniejudd@gmail.com", :subject=>"New Lead from headupinc.com!")
  end
end
