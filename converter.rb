class Converter
  def decimal_to_roman(decimal)
    raise "NotImplementedError"
  end

  ROMAN_VALUES = {
    "M"  => 1000,
    "CM" => 900,
    "D"  => 500,
    "CD" => 400,
    "C"  => 100,
    "XC" => 90,
    "L"  => 50,
    "XL" => 40,
    "X"  => 10,
    "IX" => 9,
    "V"  => 5,
    "IV" => 4,
    "I"  => 1
  }

  def roman_to_decimal(roman)
    result = 0
    romans = roman.split("")

    while !romans.empty?
      first, second = romans

      if value_of(first) >= value_of(second)
        result += value_of(first)
      else
        result += value_of(second) - value_of(first)
        romans.shift
      end

      romans.shift
    end

    result
  end

  def value_of(roman)
    ROMAN_VALUES.fetch(roman) { 0 }
  end
end
