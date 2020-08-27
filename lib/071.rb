puts Rational(4,10)
puts Rational(8,17)<Rational(3,7)
smallest=0
1.upto(1000000) do |d|
  n=3*d/7
  r=Rational(n,d)
  if r>smallest && r<Rational(3,7)
    smallest=r
  end
end

puts smallest
