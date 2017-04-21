class UserMailer < ApplicationMailer
  default from: 'admin@music.com'

  def activation_email(user)
    @user = user

    @url = user_activate_url(@user) + "?activation_token=#{user.activation_token}"
    mail(to: user.email, subject: 'Activate Account')
  end
end
