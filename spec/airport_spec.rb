require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:plane_2) { double(:plane) }

  it 'should be able to land a plane' do
    expect(subject.land(plane)).to eq "#{plane} landed successfully."
  end

  it 'should be able to display a landed plane' do
    subject.land(plane)
    expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane]}"
  end

  describe "#take_off" do
    it 'should be able to instruct a plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "#{plane} taken off successfully."
    end

    it 'should raise an error if the specified plane is not in the airport' do
      subject.land(plane)
      expect { subject.take_off(plane_2) }.to raise_error "Specified plane is not in the airport!"
    end
  end

  it 'should be able to confirm that a taken off plane is no longer in the hangar' do
    subject.land(plane)
    subject.land(plane_2)
    subject.take_off(plane)
    expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane_2]}"
  end
end
