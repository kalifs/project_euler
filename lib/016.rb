pow=2**1000
puts pow.to_s.split("").inject(0){|result,nr| result+nr.to_i}
