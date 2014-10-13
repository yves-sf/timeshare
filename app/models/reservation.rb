class Reservation
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include DynamicAttributeSupport

  field :user_id,                type: :relation
  field :preferred_housing_date, type: DateTime
  field :additional_questions,   type: String

  belongs_to :user

  delegate :email, :telephone, :first_name, :last_name, :full_name, to: :user

  # dynamic fields - todo if many or variable, move to DB and probably embed in reservation
  def self.amenities
    @amenities ||= [:pool, :rec_room, :movie, :theater, :on_site_doctor, :time_machine ]
  end

  def amenities
    self.class.amenities
  end

  def add_dynamic_fields(dyna_fields, type=String)
    # add the dynamic fields in the singleton
    (class << self; self; end).class_eval do
      [dyna_fields].flatten.each { |df| field df, type: type }
    end
  end

end
