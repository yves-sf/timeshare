class ReservationsController < InheritedResources::Base
  respond_to :html

  def new
    @reservation = Reservation.new
    @reservation.add_dynamic_fields @reservation.amenities, Boolean
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.valid? && check_date(@reservation, :preferred_housing_date, reservation_params)
      @reservation.save!
      send_confirmation_emails @reservation, current_user, request
      redirect_to @reservation
    else
      render new_reservation_path and return
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit([:preferred_housing_date, :additional_questions].concat(Reservation.amenities))
  end

  def send_confirmation_emails(reservation, current_user, request)
    UserMailer.confirmation_reservation(reservation, current_user, request.host_with_port).deliver
    OfficeMailer.desk_resa_request(reservation, current_user, request.ip).deliver
  end

  def check_date(model, date_field, model_params)
    true
    begin
    Date.strptime(model_params[date_field], '%m/%d/%Y')
    rescue ArgumentError
      model.errors.add date_field, "Error date must be in the format MM/DD/YYYY"
      false
    end
  end

end
