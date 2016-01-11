require 'bindata'

class Bool < BinData::Primitive
  bit1 :bool, initial_value: 0

  def get
    bool == 1
  end

  def set(value)
    self.bool = value ? 1 : 0
  end
end
