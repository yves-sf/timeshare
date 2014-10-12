require 'rails_helper'

describe "dynamic attributes" do

  class DynamicModel
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include DynamicAttributeSupport
    field :static_field, type: String
  end

  context "#dynamic_attribute" do
    let(:dyna) { DynamicModel.new(amenity: 'pool', static_field: 'whatever') }

    it {expect(dyna.dynamic_attributes).to eq ['amenity']}
  end

  context "#static_attributes" do
    let(:dyna) { DynamicModel.new(amenity: 'pool') }

    it { expect(dyna.static_attributes).to include 'static_field' }
    it { expect(dyna.static_attributes).to_not include 'amenity' }
  end

  describe "allow ::create with dynamic attributes" do
    let!(:dyna)    { DynamicModel.create(pool: '1', sauna: '0') }
    let!(:dyna_db) { DynamicModel.find dyna }

    it { expect(dyna_db.pool).to eq '1' }
    it { expect(dyna_db.sauna).to eq '0'}
    it { expect(dyna.dynamic_attributes).to eq ['pool', 'sauna'] }
  end

end