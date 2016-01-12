describe 'BinData::Enum8, BinData::Enum16, BinData::Enum32' do
  before(:all) do
    class MyClass < BinData::Record
      endian :big
      enum8 :enum8, list: {default: 0, a: 1, b: 2, c: 3}
      enum16 :enum16, list: {default: 0, d: 0x0101, e: 0x0202, f: 0x0303}
      enum32 :enum32, list: {g: 0x01010101, h: 0x02020202, i: 0x03030303}
    end
  end

  it 'should read binary' do
    cls = MyClass.read [
      1,
      2, 2,
      3, 3, 3, 3
    ].pack('C*')
    expect(cls.enum8).to eq(:a)
    expect(cls.enum16).to eq(:e)
    expect(cls.enum32).to eq(:i)
  end
  it 'should initialize with default values' do
    cls = MyClass.new
    expect(cls.enum8).to eq(:default)
    expect(cls.enum16).to eq(:default)
    expect(cls.enum32).to eq(0)
  end
  it 'should initialize with some values' do
    cls = MyClass.new(
      enum8: :c,
      enum16: :d,
      enum32: :h
    )
    expect(cls.enum8).to eq(:c)
    expect(cls.enum16).to eq(:d)
    expect(cls.enum32).to eq(:h)
  end
end
