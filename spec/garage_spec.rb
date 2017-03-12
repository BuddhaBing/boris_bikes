require 'garage'

describe Garage do
  it 'Rceives broken bikes' do
    expect(subject).to respond_to :receive_bike
  end
end
