# Roman Numerals Kata

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis[[1]](http://sights.seindal.dk/sight/456_Roman_Villa_of_Piazza_Armerina.html). One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets)

Values less than 3999 in the Roman numeral system are written using seven “digits” whose decimal equivalents are given in the table below. (There are additional conventions for writing values larger than 3999, which we will not discuss here.)

## Decimal Value to Roman Numerals

Write and test a method `decimal_to_roman` that, given a positive integer less than 3999, returns the corresponding roman numeral. Given `1999` as argument, your `decimal_to_roman` method should return `"MCMXCIX"`.

```ruby
expect(decimal_to_roman(1999)).to eq "MCMXCIX"
expect(decimal_to_roman(1987)).to eq "MCMLXXXVII"
expect(decimal_to_roman(339)).to  eq "CCCXXXIX"
```

## Roman Numerals to Decimal Value

Write and test a method `roman_to_decimal` that, given a string representing a legal Roman numeral, returns the corresponding decimal value. Given this string `"MCMXCIX"` as argument, your `roman_to_decimal` method should return 1999.

```ruby
expect(roman_to_decimal("MCMXCIX")).to    eq 1999
expect(roman_to_decimal("MCMLXXXVII")).to eq 1987
expect(roman_to_decimal("CCCXXXIX")).to   eq 339
```

## References

- https://inst.eecs.berkeley.edu/~selfpace/studyguide/3S.rdngs/roman.nums.case.pdf
- http://codingdojo.org/cgi-bin/index.pl?KataRomanNumerals
