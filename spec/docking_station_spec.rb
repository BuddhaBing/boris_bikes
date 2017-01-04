require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike }
  it 'would accept dock' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq true
  end
  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

end
