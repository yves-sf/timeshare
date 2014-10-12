class UserMailer < ActionMailer::Base
  default from: "timeshare@example.com"

  def confirmation_request(user, host)
    @user = user
    @url  = "http://#{host}/users/#{@user.token}/token"
    mail(to: @user.email, subject: "Please confirm your email ")
  end

  def confirmation_reservation(reservation, user)
    @reservation = reservation
    @user = user
    mail(to: @user.email, subject: "Reservation request confirmation ")
  end
end
