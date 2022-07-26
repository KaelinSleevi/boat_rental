require './lib/boat'
require './lib/renter'
require './lib/Dock'
require 'rspec'

RSpec.describe Dock do
  context 'Iteration 2' do
    it 'dock exists' do
      dock = Dock.new("The Rowing Dock", 3)

      expect(dock).to be_an_instance_of(Dock)
    end

    it 'dock has a name' do
      dock = Dock.new("The Rowing Dock", 3)

      expect(dock.name).to eq("The Rowing Dock")
    end

    it 'dock has a max rental time' do
      dock = Dock.new("The Rowing Dock", 3)

      expect(dock.max_rental_time).to eq(3)
    end

    it 'dock has three available boats to rent' do
      dock = Dock.new("The Rowing Dock", 3)
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)
      sup_1 = Boat.new(:standup_paddle_board, 15)

      dock.add_boat(kayak_1)
      dock.add_boat(kayak_2)
      dock.add_boat(sup_1)

      expect(dock.boats).to eq([kayak_1, kayak_2, sup_1])
    end

    it 'dock has two people who want to rent' do
        dock = Dock.new("The Rowing Dock", 3)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")

        dock.add_renters(patrick)
        dock.add_renters(eugene)

        expect(dock.renters).to eq([patrick, eugene])
      end

      it 'dock has a rental log' do
        dock = Dock.new("The Rowing Dock", 3)
        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")

        dock.add_boat(kayak_1)
        dock.add_boat(kayak_2)
        dock.add_boat(sup_1)

        dock.add_renters(patrick)
        dock.add_renters(eugene)

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        expect(dock.rental_log).to eq({kayak_1 => patrick, kayak_2 => patrick, sup_1 => eugene})
      end

      it 'can charge based on hours and kayaks' do
        dock = Dock.new("The Rowing Dock", 3)
        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")

        dock.add_boat(kayak_1)
        dock.add_boat(kayak_2)
        dock.add_boat(sup_1)

        dock.add_renters(patrick)
        dock.add_renters(eugene)

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        kayak_1.add_hour
        kayak_1.add_hour

        dock.charge(kayak_1)

        expect(dock.charge(kayak_1)).to eq({:card_number => patrick.credit_card_number, :amount => 40})
      end

      it 'can charge based on hours and boards' do
        dock = Dock.new("The Rowing Dock", 3)
        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")

        dock.add_boat(kayak_1)
        dock.add_boat(kayak_2)
        dock.add_boat(sup_1)

        dock.add_renters(patrick)
        dock.add_renters(eugene)

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        sup_1.add_hour
        sup_1.add_hour
        sup_1.add_hour

        expect(dock.charge(sup_1)).to eq({:card_number => eugene.credit_card_number, :amount => 45})
      end
    end
  end
