require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike }
  it { is_expected.to respond_to(:dock_bike).with(2).arguments }
  it 'default capacity is set' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end
  it 'records a bike being reported as broken' do
    subject.dock_bike(Bike.new,false)
    bike = subject.release_bike
    expect(bike.working?).to eq false
  end
  
  it 'allows the user to specify a custom capacity' do
    expect(DockingStation).to receive(:new).with(10)
    DockingStation.new(10)
  end
  it 'would accept dock' do
    expect(subject.dock_bike(Bike.new)).to eq true
  end
  it 'correctly shows currently docked bikes' do
    expect(subject.bikes).to eq []
  end
  it 'shows no bikes when we remove the bike in it' do
    subject.dock_bike(Bike.new)
    subject.release_bike
    expect(subject.bikes).to eq []
  end
  it 'raises an error when told to release a bike when docking station' do
    expect{subject.release_bike}.to raise_error("no bikes available")
  end
  it 'does not allow more bikes to be docked than the docking station\'s capacity' do
    expect{ 20.times {subject.dock_bike(Bike.new)}}.not_to raise_error
  end

  context "when one bike in rack," do
    before  (:each) do
      subject.dock_bike(Bike.new)
    end
    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
    it 'shows currently docked bikes when asked' do
      expect(subject.bikes.class).to eq Array
    end
    it 'does not allow more bikes to be docked than the docking station\'s capacity' do
      expect{ 20.times {subject.dock_bike(Bike.new)} }.to raise_error("docking station full")
    end
  end
end

# Write a manual feature test for the above feature. Consider using 20.times { docking_station.dock Bike.new }
