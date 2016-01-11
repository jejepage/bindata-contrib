require 'spec_helper'

describe Ipv6Address do
  it 'should read binary' do
    addr = Ipv6Address.read [
      0x20, 0x01,
      0x0d, 0xb8,
      0x85, 0xa3,
      0, 0,
      0, 0,
      0x8a, 0x2e,
      0x03, 0x70,
      0x73, 0x34
    ].pack('C*')
    expect(addr).to eq('2001:db8:85a3:0:0:8a2e:370:7334')
  end
  it 'should initialize with default values' do
    addr = Ipv6Address.new
    expect(addr).to eq('0:0:0:0:0:0:0:0')
  end
  it 'should initialize with some values' do
    addr = Ipv6Address.new('2001:db8:85a3:0:0:8a2e:370:7334')
    expect(addr).to eq('2001:db8:85a3:0:0:8a2e:370:7334')
  end
end
