
d=""
d2=""
in_new=false
i=1
total_size=0
while total_size<=1000000
  str=i.to_s
  total_size+=str.size
  if total_size>=500000
    in_new=true
  end
  if in_new
    d2+=str
  else
    d+=str
  end
  i+=1
end

ds=999999-d.size

result=d[0].to_i*d[9].to_i*d[99].to_i*d[999].to_i*d[9999].to_i*d[99999].to_i*d2[ds].to_i
puts result