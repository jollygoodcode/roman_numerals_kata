require_relative "../converter"

RSpec.describe Converter do
  subject(:converter) { Converter.new }

  def roman_to_decimal(roman)
    converter.roman_to_decimal(roman)
  end

  it { expect(roman_to_decimal("I")).to eq 1    }

  it { expect(roman_to_decimal("IV")).to eq 4   }
  it { expect(roman_to_decimal("V")).to eq 5    }
  it { expect(roman_to_decimal("IX")).to eq 9   }
  it { expect(roman_to_decimal("X")).to eq 10   }

  it { expect(roman_to_decimal("XL")).to eq 40  }
  it { expect(roman_to_decimal("L")).to eq 50   }
  it { expect(roman_to_decimal("XC")).to eq 90  }

  it { expect(roman_to_decimal("C")).to eq 100  }
  it { expect(roman_to_decimal("CD")).to eq 400 }
  it { expect(roman_to_decimal("D")).to eq 500  }
  it { expect(roman_to_decimal("CM")).to eq 900 }

  it { expect(roman_to_decimal("M")).to eq 1000 }

  it "CCCXXXIX to 339" do
    expect(roman_to_decimal("CCCXXXIX")).to eq 339
  end

  it "MCMLXXXVII to 1987" do
    expect(roman_to_decimal("MCMLXXXVII")).to eq 1987
  end

  it "MCMXCIX to 1999" do
    expect(roman_to_decimal("MCMXCIX")).to eq 1999
  end
end
