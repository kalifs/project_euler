# Square root;

require 'bigdecimal'
sum = 0
excluded = [1,4,9,16,25,36,49,64,81,100]

1.upto(100) do |number|
  root = BigDecimal(number).sqrt(105).to_s
  digits = root.split(".").last.sub(/E\d+/,"").slice(0..99)
  if digits.size == 100 && !excluded.include?(number)
    digits_sum = digits.split("").inject(0){ |result, digit| result += digit.to_i}
    sum += digits_sum
  end
end

puts "Sum:#{sum}"

