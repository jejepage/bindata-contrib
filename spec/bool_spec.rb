require 'spec_helper'

describe Bool do
  it 'should read binary' do
    bool = Bool.read [0x80].pack('C*')
    expect(bool).to eq(true)

    bool = Bool.read [0].pack('C*')
    expect(bool).to eq(false)
  end
  it 'should initialize with default values' do
    bool = Bool.new
    expect(bool).to eq(false)
  end
  it 'should initialize with some values' do
    bool = Bool.new(true)
    expect(bool).to eq(true)
  end
end
