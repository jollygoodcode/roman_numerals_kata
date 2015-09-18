class Converter
  def decimal_to_roman(decimal)
    if decimal == 5
      "V"
    else
      "I" * decimal
    end
  end

  def roman_to_decimal(roman)
    raise "NotImplementedError"
  end
end
