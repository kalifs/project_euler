require 'rational'
def denum(n)
  return Rational(1,2) if n<=1
  Rational(1,2+denum(n-1))
end


result=0
1.upto(1000) do |n|
  r=1+denum(n)
  d=r.denominator
  n=r.numerator
  if n.to_s.size>d.to_s.size
    result+=1
  end
end
puts result

