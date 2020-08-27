require 'prime'
puts Prime.prime_division(256).inspect

def tr_nr(lim)
  ((lim.to_f/2.0)*(1.0+lim.to_f)).to_i
end

def divisors(nr)
  factors=Prime.prime_division(nr).map{|arr| arr[1]}
  factors.inject(1){|result,f| result*(f+1)}
end

div=0
nr=1
answer=0
while div<501
  answer=tr_nr(nr)
  div=divisors(answer)
  nr+=1
end
puts div.inspect
puts answer
puts nr-1


