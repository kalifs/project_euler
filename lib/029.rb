
p=[]

2.upto(100) do |a|
  2.upto(100) do |b|
    p<<a**b
  end
end

puts p.uniq.size
