
def digit_sum(nr)
  nr.to_s.split("").inject(0){|sum,d| sum+d.to_i}
end
greatest=0
1.upto(99) do |a|
  1.upto(99) do |b|
    s=digit_sum(a**b)
    if s>greatest
      greatest=s
    end
  end
end

puts greatest
