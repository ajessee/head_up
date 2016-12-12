class MyMailer < ApplicationMailer

  def send_new_lead_email(options={})
    @name = options[:name]
    @email = options[:email]
    @phone = options[:phone]
    @message = options[:message]
    mail(:to=>"stephanie@wolfandheron.com", :subject=>"New Lead from headupinc.com!")
  end
end
