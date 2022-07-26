require './lib/boat'
require './lib/renter'
require 'rspec'

RSpec.describe Renter do
  context 'Iteration 1' do
    it 'renter exists' do
      renter = Renter.new("Patrick Star", "4242424242424242")

      expect(renter).to be_an_instance_of(Renter)
    end
  end
end
