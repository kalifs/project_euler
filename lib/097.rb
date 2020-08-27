
sk=2
lim=7830457
1.upto(lim) do
  sk=sk*2
  if sk.to_s.size>15
    temp=sk.to_s
    sk=temp.slice(temp.size-15..temp.size-1).to_i
  end
end

puts sk*28433+1