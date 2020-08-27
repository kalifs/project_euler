
p=[]
c=[]
1.upto(4) do |point|
  p<<point
end
1.upto(6) do |point|
  c<<point
end

pete=p.repeated_combination(9).to_a.map{|a| a.inject(0){|s,el| s+el}}.sort
colin=c.repeated_combination(6).to_a.map{|a| a.inject(0){|s,el| s+el}}.sort

puts pete.inspect
puts colin.inspect
puts i+1
puts pete.size
puts colin.size

