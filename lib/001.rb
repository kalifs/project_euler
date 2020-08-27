sum=0
1.upto(999) do |nr|
  sum+=nr if nr%3==0 || nr%5==0
end
puts sum