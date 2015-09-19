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
    ROMAN_VALUES.fetch(roman) { 0 }
  end
end
