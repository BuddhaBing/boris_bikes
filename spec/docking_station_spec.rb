require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'shows currently docked bikes when empty' do
    subject.release_bike
    expect(subject.bikes).to eq []
  end
  it 'shows currently docked bikes when asked' do
    expect(subject).to respond_to :bikes
  end
  it 'shows no bikes when we remove the bike in it' do
    subject.release_bike
    expect(subject.bikes).to eq []
  end
  it 'raises an error when told to release a bike when docking station is empty' do
    subject.release_bike
    expect{subject.release_bike}.to raise_error("no bikes available")
  end

  it 'raises error if station full' do
    bike = subject.release_bike
    20.times { subject.dock_bike Bike.new }
    expect{subject.dock_bike(Bike.new)}.to raise_error("bike station full")
  end

end
