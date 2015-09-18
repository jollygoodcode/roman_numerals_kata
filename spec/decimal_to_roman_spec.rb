require_relative "../converter"

RSpec.describe Converter do
  subject(:converter) { Converter.new }

  def decimal_to_roman(decimal)
    converter.decimal_to_roman(decimal)
  end

  it { expect(decimal_to_roman(1)).to eq "I"    }
  it { expect(decimal_to_roman(2)).to eq "II"   }
  it { expect(decimal_to_roman(3)).to eq "III"  }

  it { expect(decimal_to_roman(4)).to eq "IV"   }
  it { expect(decimal_to_roman(5)).to eq "V"    }
  it { expect(decimal_to_roman(6)).to eq "VI"   }

  it { expect(decimal_to_roman(9)).to eq "IX"   }
  it { expect(decimal_to_roman(10)).to eq "X"   }

  it { expect(decimal_to_roman(20)).to eq "XX"  }

  it { expect(decimal_to_roman(40)).to eq "XL"  }
  it { expect(decimal_to_roman(50)).to eq "L"   }
  it { expect(decimal_to_roman(90)).to eq "XC"  }

  it { expect(decimal_to_roman(100)).to eq "C"  }
  it { expect(decimal_to_roman(400)).to eq "CD" }
  it { expect(decimal_to_roman(500)).to eq "D"  }
  it { expect(decimal_to_roman(900)).to eq "CM" }

  it { expect(decimal_to_roman(1000)).to eq "M" }

  it "339 to CCCXXXIX" do
    expect(decimal_to_roman(339)).to eq "CCCXXXIX"
  end

  it "1987 to MCMLXXXVII" do
    expect(decimal_to_roman(1987)).to eq "MCMLXXXVII"
  end

  it "1999 to MCMXCIX" do
    expect(decimal_to_roman(1999)).to eq "MCMXCIX"
  end
end
