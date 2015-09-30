##### 1.1 Add specs for converting 1, 2, 3

- `spec/decimal_to_roman_spec.rb`

  ```diff
  +require_relative "../converter"
  +
  +RSpec.describe Converter do
  +  subject(:converter) { Converter.new }
  +
  +  def decimal_to_roman(decimal)
  +    converter.decimal_to_roman(decimal)
  +  end
  +
  +  it { expect(decimal_to_roman(1)).to eq "I"   }
  +  it { expect(decimal_to_roman(2)).to eq "II"  }
  +  it { expect(decimal_to_roman(3)).to eq "III" }
  +end
  ```

##### 1.2 Make it pass

- `converter.rb`

  ```diff
   class Converter
     def decimal_to_roman(decimal)
  -    raise "NotImplementedError"
  +    "I" * decimal
     end

     def roman_to_decimal(roman)
  ```

##### 1.3 Add spec for convert 5 to V

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(1)).to eq "I"   }
     it { expect(decimal_to_roman(2)).to eq "II"  }
     it { expect(decimal_to_roman(3)).to eq "III" }
  +
  +  it { expect(decimal_to_roman(5)).to eq "V"   }
   end
  ```

##### 1.4 Make it pass

- `converter.rb`

  ```diff
   class Converter
     def decimal_to_roman(decimal)
  -    "I" * decimal
  +    if decimal == 5
  +      "V"
  +    else
  +      "I" * decimal
  +    end
     end

     def roman_to_decimal(roman)
  ```

##### 1.5 Add spec for convert 6 to VI

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(3)).to eq "III" }

     it { expect(decimal_to_roman(5)).to eq "V"   }
  +  it { expect(decimal_to_roman(6)).to eq "VI"  }
   end
  ```

##### 1.6 Make it pass

- `converter.rb`

  ```diff
   class Converter
     def decimal_to_roman(decimal)
  -    if decimal == 5
  -      "V"
  -    else
  -      "I" * decimal
  +    n, result = decimal, ""
  +
  +    if n >= 5
  +      result << "V"
  +      n -= 5
       end
  +
  +    result << "I" * n
     end

     def roman_to_decimal(roman)
  ```

##### 1.7 Add spec for convert 10 to X

- `spec/decimal_to_roman_spec.rb`

  ```diff

     it { expect(decimal_to_roman(5)).to eq "V"   }
     it { expect(decimal_to_roman(6)).to eq "VI"  }
  +
  +  it { expect(decimal_to_roman(10)).to eq "X"  }
   end
  ```

##### 1.8 Make it pass

- `converter.rb`

  ```diff
     def decimal_to_roman(decimal)
       n, result = decimal, ""

  +    if n >= 10
  +      result << "X"
  +      n -= 10
  +    end
  +
       if n >= 5
         result << "V"
         n -= 5
  ```

##### 1.9 Add spec for convert 20 to XX

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(6)).to eq "VI"  }

     it { expect(decimal_to_roman(10)).to eq "X"  }
  +
  +  it { expect(decimal_to_roman(20)).to eq "XX" }
   end
  ```

##### 1.10 Make it pass

- `converter.rb`

  ```diff
     def decimal_to_roman(decimal)
       n, result = decimal, ""

  -    if n >= 10
  +    while n >= 10
         result << "X"
         n -= 10
       end
  ```

##### 1.11 Add spec for convert 4 to IV

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(2)).to eq "II"  }
     it { expect(decimal_to_roman(3)).to eq "III" }

  +  it { expect(decimal_to_roman(4)).to eq "IV"  }
     it { expect(decimal_to_roman(5)).to eq "V"   }
     it { expect(decimal_to_roman(6)).to eq "VI"  }

  ```

##### 1.12 Make it pass

- `converter.rb`

  ```diff
         n -= 5
       end

  +    if n >= 4
  +      result << "IV"
  +      n -= 4
  +    end
  +
       result << "I" * n
     end

  ```

##### 1.13 Refactor a little bit

- `converter.rb`

  ```diff
         n -= 4
       end

  -    result << "I" * n
  +    while n >= 1
  +      result << "I"
  +      n -= 1
  +    end
  +
  +    result
     end

     def roman_to_decimal(roman)
  ```

##### 1.14 All while works

- `converter.rb`

  ```diff
         n -= 10
       end

  -    if n >= 5
  +    while n >= 5
         result << "V"
         n -= 5
       end

  -    if n >= 4
  +    while n >= 4
         result << "IV"
         n -= 4
       end
  ```

##### 1.15 Don't Repeat Yourself

- `converter.rb`

  ```diff
   class Converter
  +  DECIMAL_ROMAN = [
  +    [10, "X"],
  +    [5,  "V"],
  +    [4, "IV"],
  +    [1,  "I"],
  +  ]
  +
     def decimal_to_roman(decimal)
       n, result = decimal, ""

  -    while n >= 10
  -      result << "X"
  -      n -= 10
  -    end
  -
  -    while n >= 5
  -      result << "V"
  -      n -= 5
  -    end
  -
  -    while n >= 4
  -      result << "IV"
  -      n -= 4
  -    end
  -
  -    while n >= 1
  -      result << "I"
  -      n -= 1
  +    DECIMAL_ROMAN.each do |value, roman|
  +      while n >= value
  +        result << roman
  +        n -= value
  +      end
       end

       result
  ```

##### 1.16 Add a spec for convert 9 to IX

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(5)).to eq "V"   }
     it { expect(decimal_to_roman(6)).to eq "VI"  }

  +  it { expect(decimal_to_roman(9)).to eq "IX"  }
     it { expect(decimal_to_roman(10)).to eq "X"  }

     it { expect(decimal_to_roman(20)).to eq "XX" }
  ```

##### 1.17 Make it pass

- `converter.rb`

  ```diff
   class Converter
     DECIMAL_ROMAN = [
       [10, "X"],
  +
  +    [9, "IX"],
       [5,  "V"],
       [4, "IV"],
       [1,  "I"],
  ```

##### 1.18 Add spec for convert 40, 50, 90

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(10)).to eq "X"  }

     it { expect(decimal_to_roman(20)).to eq "XX" }
  +
  +  it { expect(decimal_to_roman(40)).to eq "XL" }
  +  it { expect(decimal_to_roman(50)).to eq "L"  }
  +  it { expect(decimal_to_roman(90)).to eq "XC" }
   end
  ```

##### 1.19 Make it pass

- `converter.rb`

  ```diff
   class Converter
     DECIMAL_ROMAN = [
  -    [10, "X"],
  +    [90, "XC"],
  +    [50,  "L"],
  +    [40, "XL"],
  +    [10,  "X"],

  -    [9, "IX"],
  -    [5,  "V"],
  -    [4, "IV"],
  -    [1,  "I"],
  +    [9,  "IX"],
  +    [5,   "V"],
  +    [4,  "IV"],
  +    [1,   "I"],
     ]

     def decimal_to_roman(decimal)
  ```

##### 1.20 Add specs for convert 100, 400, 500, 900

- `spec/decimal_to_roman_spec.rb`

  ```diff
       converter.decimal_to_roman(decimal)
     end

  -  it { expect(decimal_to_roman(1)).to eq "I"   }
  -  it { expect(decimal_to_roman(2)).to eq "II"  }
  -  it { expect(decimal_to_roman(3)).to eq "III" }
  +  it { expect(decimal_to_roman(1)).to eq "I"    }
  +  it { expect(decimal_to_roman(2)).to eq "II"   }
  +  it { expect(decimal_to_roman(3)).to eq "III"  }

  -  it { expect(decimal_to_roman(4)).to eq "IV"  }
  -  it { expect(decimal_to_roman(5)).to eq "V"   }
  -  it { expect(decimal_to_roman(6)).to eq "VI"  }
  +  it { expect(decimal_to_roman(4)).to eq "IV"   }
  +  it { expect(decimal_to_roman(5)).to eq "V"    }
  +  it { expect(decimal_to_roman(6)).to eq "VI"   }

  -  it { expect(decimal_to_roman(9)).to eq "IX"  }
  -  it { expect(decimal_to_roman(10)).to eq "X"  }
  +  it { expect(decimal_to_roman(9)).to eq "IX"   }
  +  it { expect(decimal_to_roman(10)).to eq "X"   }

  -  it { expect(decimal_to_roman(20)).to eq "XX" }
  +  it { expect(decimal_to_roman(20)).to eq "XX"  }

  -  it { expect(decimal_to_roman(40)).to eq "XL" }
  -  it { expect(decimal_to_roman(50)).to eq "L"  }
  -  it { expect(decimal_to_roman(90)).to eq "XC" }
  +  it { expect(decimal_to_roman(40)).to eq "XL"  }
  +  it { expect(decimal_to_roman(50)).to eq "L"   }
  +  it { expect(decimal_to_roman(90)).to eq "XC"  }
  +
  +  it { expect(decimal_to_roman(100)).to eq "C"  }
  +  it { expect(decimal_to_roman(400)).to eq "CD" }
  +  it { expect(decimal_to_roman(500)).to eq "D"  }
  +  it { expect(decimal_to_roman(900)).to eq "CM" }
   end
  ```

##### 1.21 Make it pass

- `converter.rb`

  ```diff
   class Converter
     DECIMAL_ROMAN = [
  -    [90, "XC"],
  -    [50,  "L"],
  -    [40, "XL"],
  -    [10,  "X"],
  +    [900, "CM"],
  +    [500,  "D"],
  +    [400, "CD"],
  +    [100,  "C"],

  -    [9,  "IX"],
  -    [5,   "V"],
  -    [4,  "IV"],
  -    [1,   "I"],
  +    [90,  "XC"],
  +    [50,   "L"],
  +    [40,  "XL"],
  +    [10,   "X"],
  +
  +    [9,   "IX"],
  +    [5,    "V"],
  +    [4,   "IV"],
  +    [1,    "I"],
     ]

     def decimal_to_roman(decimal)
  ```

##### 1.22 Add spec for convert 1000

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(400)).to eq "CD" }
     it { expect(decimal_to_roman(500)).to eq "D"  }
     it { expect(decimal_to_roman(900)).to eq "CM" }
  +
  +  it { expect(decimal_to_roman(1000)).to eq "M" }
   end
  ```

##### 1.23 Make it pass

- `converter.rb`

  ```diff
   class Converter
     DECIMAL_ROMAN = [
  +    [1000, "M"],
  +
       [900, "CM"],
       [500,  "D"],
       [400, "CD"],
  ```

##### 1.24 Make our specs complete

- `spec/decimal_to_roman_spec.rb`

  ```diff
     it { expect(decimal_to_roman(900)).to eq "CM" }

     it { expect(decimal_to_roman(1000)).to eq "M" }
  +
  +  it "339 to CCCXXXIX" do
  +    expect(decimal_to_roman(339)).to eq "CCCXXXIX"
  +  end
  +
  +  it "1987 to MCMLXXXVII" do
  +    expect(decimal_to_roman(1987)).to eq "MCMLXXXVII"
  +  end
  +
  +  it "1999 to MCMXCIX" do
  +    expect(decimal_to_roman(1999)).to eq "MCMXCIX"
  +  end
   end
  ```

##### 2.1 Add specs for elements of roman

- `spec/roman_to_decimal_spec.rb`

  ```diff
  +require_relative "../converter"
  +
  +RSpec.describe Converter do
  +  subject(:converter) { Converter.new }
  +
  +  def roman_to_decimal(roman)
  +    converter.roman_to_decimal(roman)
  +  end
  +
  +  it { expect(roman_to_decimal("I")).to eq 1    }
  +
  +  it { expect(roman_to_decimal("IV")).to eq 4   }
  +  it { expect(roman_to_decimal("V")).to eq 5    }
  +  it { expect(roman_to_decimal("IX")).to eq 9   }
  +  it { expect(roman_to_decimal("X")).to eq 10   }
  +
  +  it { expect(roman_to_decimal("XL")).to eq 40  }
  +  it { expect(roman_to_decimal("L")).to eq 50   }
  +  it { expect(roman_to_decimal("XC")).to eq 90  }
  +
  +  it { expect(roman_to_decimal("C")).to eq 100  }
  +  it { expect(roman_to_decimal("CD")).to eq 400 }
  +  it { expect(roman_to_decimal("D")).to eq 500  }
  +  it { expect(roman_to_decimal("CM")).to eq 900 }
  +
  +  it { expect(roman_to_decimal("M")).to eq 1000 }
  +end
  ```

##### 2.2 Make it pass

- `converter.rb`

  ```diff
       raise "NotImplementedError"
     end

  +  ROMAN_VALUES = {
  +    "M"  => 1000,
  +    "CM" => 900,
  +    "D"  => 500,
  +    "CD" => 400,
  +    "C"  => 100,
  +    "XC" => 90,
  +    "L"  => 50,
  +    "XL" => 40,
  +    "X"  => 10,
  +    "IX" => 9,
  +    "V"  => 5,
  +    "IV" => 4,
  +    "I"  => 1
  +  }
  +
     def roman_to_decimal(roman)
  -    raise "NotImplementedError"
  +    ROMAN_VALUES.fetch(roman) { 0 }
     end
   end
  ```

##### 2.3 Add cases to make it fail

- `spec/roman_to_decimal_spec.rb`

  ```diff
     it { expect(roman_to_decimal("CM")).to eq 900 }

     it { expect(roman_to_decimal("M")).to eq 1000 }
  +
  +  it "CCCXXXIX to 339" do
  +    expect(roman_to_decimal("CCCXXXIX")).to eq 339
  +  end
  +
  +  it "MCMLXXXVII to 1987" do
  +    expect(roman_to_decimal("MCMLXXXVII")).to eq 1987
  +  end
  +
  +  it "MCMXCIX to 1999" do
  +    expect(roman_to_decimal("MCMXCIX")).to eq 1999
  +  end
   end
  ```

##### 2.4 Make it pass

- `converter.rb`

  ```diff
     }

     def roman_to_decimal(roman)
  +    result = 0
  +    romans = roman.split("")
  +
  +    while !romans.empty?
  +      first, second = romans
  +
  +      if value_of(first) >= value_of(second)
  +        result += value_of(first)
  +      else
  +        result += value_of(second) - value_of(first)
  +        romans.shift
  +      end
  +
  +      romans.shift
  +    end
  +
  +    result
  +  end
  +
  +  def value_of(roman)
       ROMAN_VALUES.fetch(roman) { 0 }
     end
   end
  ```
