# Preview all emails at http://localhost:3000/rails/mailers/my_mailer
class MyMailerPreview < ActionMailer::Preview

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    MyMailer.account_activation(user)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/my_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    MyMailer.password_reset(user)
  end

end
