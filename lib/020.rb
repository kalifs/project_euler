def fact(n)
  if n == 0
    1
  else
    n * fact(n-1)
  end
end

puts fact(100).to_s.split("").inject(0){|result,d| result+d.to_i}
