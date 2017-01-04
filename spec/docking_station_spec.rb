require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike }

  context "one bike in rack" do
    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
    it 'shows currently docked bikes when asked' do
      expect(subject.view_bikes.class).to eq Bike
    end
    it 'does not allow more bikes to be docked than the docking station\'s capacity' do
      bike = Bike.new
      expect{ 20.times {subject.dock_bike(bike)} }.to raise_error("docking station full")
    end
  end

  context "empty rack" do
    before  (:each) do
      subject.release_bike
    end
    it 'would accept dock' do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to eq true
    end

    it 'correctly shows currently docked bikes when empty' do
      expect(subject.view_bikes).to eq nil
    end
    it 'shows no bikes when we remove the bike in it' do
      bike = Bike.new
      subject.dock_bike(bike)
      subject.release_bike
      expect(subject.view_bikes).to eq nil
    end
    it 'raises an error when told to release a bike when docking station is empty' do
      expect{subject.release_bike}.to raise_error("no bikes available")
    end
    it 'does not allow more bikes to be docked than the docking station\'s capacity' do
      bike = Bike.new
      expect( 20.times {subject.dock_bike(bike)} ).to eq true
    end
  end

# Write a manual feature test for the above feature. Consider using 20.times { docking_station.dock Bike.new }


end
