require 'spec_helper'

describe Ipv4Address do
  it 'should read binary' do
    addr = Ipv4Address.read [127, 0, 0, 1].pack('C*')
    expect(addr).to eq('127.0.0.1')
  end
  it 'should initialize with default values' do
    addr = Ipv4Address.new
    expect(addr).to eq('0.0.0.0')
  end
  it 'should initialize with some values' do
    addr = Ipv4Address.new('192.168.1.2')
    expect(addr).to eq('192.168.1.2')
  end
end
