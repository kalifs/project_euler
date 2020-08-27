require 'prime'
sum=0
Prime.each(2000000) do |prime|
  sum+=prime
end
puts sum