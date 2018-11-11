class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.welcome.subject
  #
  def welcome(user_name)
    @user_name = user_name
    mail to: "pmohansaikrishna@gmail.com", subject: "Your room has been successfully authorized"
  end
end
