class UserMailer < ActionMailer::Base
  default from: "timeshare@example.com"

  def confirmation_request(user, host)
    @user = user
    @url  = "http://#{host}/users/confirm_user"
    # @url  = "localhost:3000/users/confirm_user"
    mail(to: @user.email, subject: "Please confirm your email ")
  end
end