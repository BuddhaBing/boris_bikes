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
  it 'shows currently docked bikes when empty' do
    expect(subject.view_bikes).to eq nil
  end
  it 'shows currently docked bikes when full' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.view_bikes).to eq bike
  end
  it 'shows no bikes when we remove the bike in it' do
    bike = Bike.new
    subject.dock_bike(bike)
    subject.release_bike
    expect(subject.view_bikes).to eq nil
  end
end
