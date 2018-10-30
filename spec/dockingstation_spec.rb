require "dockingstation"
describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "gets bike" do 
    station = DockingStation.new
    expect(station.release_bike).not_to eq nil
  end
  it "is it working?" do
    station = DockingStation.new
    bike = station.release_bike
    expect(bike.working?).to eq true
  end
end
