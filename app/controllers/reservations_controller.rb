class ReservationsController < InheritedResources::Base
  respond_to :html

  def new
    @reservation = Reservation.new
    @reservation.add_dynamic_fields @reservation.amenities, Boolean
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    send_confirmation_emails @reservation, current_user, request
    redirect_to @reservation
  end

  private
  def reservation_params
    params.require(:reservation).permit([:preferred_housing_date, :additional_questions].concat(Reservation.amenities))
  end

  def send_confirmation_emails(reservation, current_user, request)
    UserMailer.confirmation_reservation(reservation, current_user, request.host).deliver
    OfficeMailer.desk_resa_request(reservation, current_user, request.ip).deliver
  end

end
