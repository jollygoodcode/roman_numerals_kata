require_relative "../converter"

RSpec.describe Converter do
  subject(:converter) { Converter.new }

  def decimal_to_roman(decimal)
    converter.decimal_to_roman(decimal)
  end

  it { expect(decimal_to_roman(1)).to eq "I"   }
  it { expect(decimal_to_roman(2)).to eq "II"  }
  it { expect(decimal_to_roman(3)).to eq "III" }

  it { expect(decimal_to_roman(5)).to eq "V"   }
  it { expect(decimal_to_roman(6)).to eq "VI"  }

  it { expect(decimal_to_roman(10)).to eq "X"  }
end
