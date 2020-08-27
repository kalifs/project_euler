
def sum_of_squres(nr)
  result=0
  1.upto(nr) do |i|
    result+=i*i
  end
  result
end

def squre_of_sum(nr)
  result=0
  1.upto(nr){|i| result+=i}
  return result*result
end

puts squre_of_sum(100)-sum_of_squres(100)