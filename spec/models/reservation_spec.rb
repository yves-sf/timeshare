require 'rails_helper'

RSpec.describe Reservation, :type => :model do

  context "variable attributes" do
    let!(:resa) { Reservation.new }

    describe "::amenities" do
      specify {expect(Reservation.amenities).to eq [:pool, :rec_room, :movie, :theater, :on_site_doctor, :time_machine ]}
    end

    it "add amenities dynamic fields" do
      expect(resa).to_not respond_to :whatever
      resa.add_dynamic_fields [:pool, :whatever], Boolean

      expect(resa).to respond_to :whatever
    end
  end

end
