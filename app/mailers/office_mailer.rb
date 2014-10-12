class OfficeMailer < ActionMailer::Base
  default from: "timeshare@example.com"

  def desk_resa_request(reservation, user, ip_address)
    @ip_address  = ip_address
    @reservation = reservation
    @user        = user
    mail(to: 'tours@example.com', subject: 'Time Share Scheduled')
  end
end
