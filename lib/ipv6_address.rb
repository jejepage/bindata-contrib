require 'bindata'

class Ipv6Address < BinData::Primitive
  endian :big
  array :octets, type: :uint16, initial_length: 8

  def get
    octets.map { |o| o.to_i.to_s(16) }.join(':')
  end

  def set(value)
    self.octets = value.split(':').map { |o| o.to_i(16) }
  end
end
