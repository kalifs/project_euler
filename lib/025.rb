#def fib(n)
#  return n if (0..1).include? n
#  fib(n-1) + fib(n-2) if n > 1
#end

f_nr=[1,1]
i=2

while f_nr.last.to_s.size<1000
  f_nr[i]=f_nr[i-1]+f_nr[i-2]
  i+=1
end

puts i