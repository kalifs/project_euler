# Math row, line calculation for e. Presision 

num = Rational(2) # starting number
denumerators = [] # all denumerators for each step

# populate denuerators, for 100th number should go up to 99 because first is 2
1.upto(99) do |i|
  denumerator = i % 3 == 2 ? (i / 3 + 1)*2 : 1
  denumerators << denumerator
end

# Go in reverse order through denumerators and sum them
last_num = 0
(denumerators.size-1).downto(0) do |i|
  current_den = last_num + denumerators[i]
  denumerator = Rational(1, current_den)
  last_num = denumerator
end

final_number = 2 + last_num # finaly add first number
puts "Numerator: #{final_number.numerator}"
# Calculate digit sum
digit_sum = final_number.numerator.to_s.split("").inject(0) do |sum, digit|
  sum + digit.to_i
end
puts "Digit sum: #{digit_sum}"
