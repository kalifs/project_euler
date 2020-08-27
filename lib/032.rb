template=%w(1 2 3 4 5 6 7 8 9)
pandigital=lambda{|s|
  s.split("").sort==template
}
good_nrs=[]
1.upto(9876) do |a|
  lim=10**((9-a.to_s.size)/2)
  a.upto(lim) do |b|
    c=a*b
    if pandigital.call("#{a}#{b}#{c}")
      good_nrs<<c
    end
  end
end

good_nrs.uniq!
puts good_nrs.inspect
puts good_nrs.inject(0){|sum,el| sum+el}