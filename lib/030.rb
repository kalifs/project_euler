
result=[]
1.upto(200000) do |nr|
  sum=nr.to_s.split("").inject(0){|sum,d| sum+d.to_i**5}
  result<<nr if sum==nr
end
puts result.inspect
puts result.inject(0){|sum, n| sum+n}
