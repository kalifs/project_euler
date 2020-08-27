def div_sum(num)
  result=[]
  1.upto(num/2) do |i|
    result << i if num%i==0
  end
  result.inject(0){|result,n| result+n}
end

div_sums={}
a_nr=[]
1.upto(10000) do |i|
  ds=div_sum(i)
  if div_sums[:"n#{ds}"]
    div_sums[:"n#{ds}"]<<i
  else
    div_sums[:"n#{ds}"]=[i]
  end
  if div_sums[:"n#{i}"] && div_sums[:"n#{i}"].include?(ds) && i!=ds
    a_nr<<i
    a_nr<<ds
  end
end
puts a_nr.inject(0){|r,n| r+n}.inspect