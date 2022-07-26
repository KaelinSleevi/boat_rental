require './lib/boat'
require './lib/renter'
require 'rspec'

RSpec.describe Boat do
  context 'Iteration 1' do
    it 'boat exists' do
      kayak = Boat.new(:kayak, 20)

      expect(kayak).to be_an_instance_of(Boat)
    end

    it 'boat has a type' do
      kayak = Boat.new(:kayak, 20)

      expect(kayak.type).to eq(:kayak)
    end

    it 'boat has a price to rent' do
      kayak = Boat.new(:kayak, 20)

      expect(kayak.price_per_hour).to eq(20)
    end

    it 'boat has no hours rented by default' do
      kayak = Boat.new(:kayak, 20)

      expect(kayak.hours_rented).to eq(0)
    end

    it 'boat can add hours rented' do
      kayak = Boat.new(:kayak, 20)

      kayak.add_hour
      kayak.add_hour
      kayak.add_hour

      expect(kayak.hours_rented).to eq(3)
    end
  end
end
