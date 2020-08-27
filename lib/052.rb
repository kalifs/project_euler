result=0
def is_same?(nr)
  x=nr.to_s.split("").sort().join("")
  2.upto(6) do |m|
    return false if (nr*m).to_s.split("").sort.join("")!=x
  end
  return true
end
1.upto(1000000) do |nr|
  if is_same?(nr)
    result=nr
    break
  end
end

puts result