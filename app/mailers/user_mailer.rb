class UserMailer < ActionMailer::Base
  default from: "timeshare@example.com"

  def confirmation_request(user, host)
    @user = user
    @url  = "http://#{host}/confirmation/new/#{@user.token}"
    mail(to: @user.email, subject: "Please confirm your email ")
  end
end
