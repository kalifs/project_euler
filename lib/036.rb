def dec2bin(n)
  [n].pack("N").unpack("B32")[0].sub(/^0+(?=\d)/, '')
end

def is_palindrome?(c)
  if c.size%2==0
    part1=c.slice(0..c.size/2-1)
    part2=c.slice(c.size/2..c.size-1)
    part2.reverse!
  else
    part1=c[0,c.size/2+1]
    part2=c[c.size/2,c.size/2+1]
    part2.reverse!
  end
  if part1==part2
    return true
  end
  return false
end

result=[]
1.upto(999999) do |number|
  if is_palindrome?(number.to_s) && is_palindrome?(dec2bin(number).to_s)
    result<<number
  end
end

puts result.inject(0){|sum,n| sum+n}
puts result.inspect
