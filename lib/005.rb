

def is_divisable?(nr)
  2.upto(20){|i| 
    return false if nr%i!=0
  }
  return true
end

nr=2520

while !is_divisable?(nr)
  nr+=20
  puts nr if nr%10000==0
end
puts nr