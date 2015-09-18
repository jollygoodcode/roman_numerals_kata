class Converter
  DECIMAL_ROMAN = [
    [90, "XC"],
    [50,  "L"],
    [40, "XL"],
    [10,  "X"],

    [9,  "IX"],
    [5,   "V"],
    [4,  "IV"],
    [1,   "I"],
  ]

  def decimal_to_roman(decimal)
    n, result = decimal, ""

    DECIMAL_ROMAN.each do |value, roman|
      while n >= value
        result << roman
        n -= value
      end
    end

    result
  end

  def roman_to_decimal(roman)
    raise "NotImplementedError"
  end
end
