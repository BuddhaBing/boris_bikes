require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike }
  it 'would accept dock' do
    subject.release_bike
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq true
  end
  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'shows currently docked bikes when empty' do
    subject.release_bike
    expect(subject.view_bikes).to eq nil
  end
  it 'shows currently docked bikes when asked' do
    expect(subject.view_bikes.class).to eq Bike
  end
  it 'shows no bikes when we remove the bike in it' do
    subject.release_bike
    bike = Bike.new
    subject.dock_bike(bike)
    subject.release_bike
    expect(subject.view_bikes).to eq nil
  end
  it 'raises an error when told to release a bike when docking station is empty' do
    subject.release_bike
    expect{subject.release_bike}.to raise_error("no bikes available")
  end
  it 'does not allow more bikes to be docked than the docking station\'s capacity' do
    bike = Bike.new
    expect{ subject.dock_bike(bike) }.to raise_error("docking station full")
  end
end
