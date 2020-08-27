require "#{File.dirname(__FILE__)}/common"
include Euler

result=0
1.upto(10000) do |n|
  counter=1
  while counter<=50
    rev_n=n.to_s.reverse.to_i
    n=n+rev_n
    if Euler.is_palindrome?(n)
      break
    end
    counter+=1
  end
  if counter>50
    result+=1
  end
end

puts result