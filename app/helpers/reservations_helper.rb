module ReservationsHelper

  def full_name
    @reservation.full_name
  end

  def email
    @reservation.email
  end

  def telephone
    @reservation.telephone
  end

  def preferred_housing_date
    @reservation.preferred_housing_date
  end

  def additional_questions
    @reservation.additional_questions
  end

  def rating
    @reservation.rating
  end

  def amenities
    ret = ""
    Reservation.amenities.each do |amenity|
      if ['1', true].include? @reservation.send(amenity)
        ret << amenity.to_s.humanize << "\n<br>"
      end
    end
    ret.html_safe
  end

  def rating_box
    if @reservation.rating
      render partial: "rating_results"
    else
      render partial: "rating_form"
    end
  end

end
