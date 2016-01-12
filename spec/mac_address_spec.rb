describe BinData::MacAddress do
  it 'should read binary' do
    addr = BinData::MacAddress.read [0x01, 0x23, 0x45, 0x67, 0x89, 0xab].pack('C*')
    expect(addr).to eq('01:23:45:67:89:ab')
  end
  it 'should initialize with default values' do
    addr = BinData::MacAddress.new
    expect(addr).to eq('00:00:00:00:00:00')
  end
  it 'should initialize with some values' do
    addr = BinData::MacAddress.new('01:23:45:67:89:ab')
    expect(addr).to eq('01:23:45:67:89:ab')
  end
end
