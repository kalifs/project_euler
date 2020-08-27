require 'prime'

found=false
n=1000000
result=[]
while !found
  div=Prime.prime_division(n)
  if div.size==4
    result<<n
    if result.size==4
      found=true
    end
  else
    result=[]
  end
  n+=1
end
puts result.inspect