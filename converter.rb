class Converter
  def decimal_to_roman(decimal)
    n, result = decimal, ""

    while n >= 10
      result << "X"
      n -= 10
    end

    if n >= 5
      result << "V"
      n -= 5
    end

    result << "I" * n
  end

  def roman_to_decimal(roman)
    raise "NotImplementedError"
  end
end
