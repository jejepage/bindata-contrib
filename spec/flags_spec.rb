describe 'BinData::Flags8, BinData::Flags16, BinData::Flags32' do
  before(:all) do
    class MyClass2 < BinData::Record
      endian :big
      flags8 :flags8, list: [:a, :b, :c]
      flags16 :flags16, list: [:d, :e, :f]
      flags32 :flags32, list: [:g, :h, :i]
    end
  end

  it 'should read binary' do
    cls = MyClass2.read [
      3,
      0, 4,
      0, 0, 0, 7
    ].pack('C*')
    expect(cls.flags8).to eq([:a, :b])
    expect(cls.flags16).to eq([:f])
    expect(cls.flags32).to eq([:g, :h, :i])
  end
  it 'should initialize with default values' do
    cls = MyClass2.new
    expect(cls.flags8).to be_empty
    expect(cls.flags16).to be_empty
    expect(cls.flags32).to be_empty
  end
  it 'should initialize with some values' do
    cls = MyClass2.new(
      flags8: [:c],
      flags16: [:d, :e]
    )
    expect(cls.flags8).to eq([:c])
    expect(cls.flags16).to eq([:d, :e])
    expect(cls.flags32).to be_empty
  end
end
