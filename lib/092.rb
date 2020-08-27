MAP = [0,1,4,9,16,25,36,49,64,81]
ARR = []

def succ(number)
  result = 0
  number.to_s.scan(/\d/) do |d|
    result += MAP[d.to_i]
  end
  result
end

def set_to(g_arr,n)
  g_arr.each do |i|
    ARR[i] = n unless ARR[i]
  end
end

sum = 0
n = 9999999
lim = 1000

1.upto(n) do |i|
  number = i
  succ(i)
  r = [number] if i < lim
  while(number!=1 && number!=89 && !ARR[number])
    number = succ(number)
    r << number if i < lim
  end
  if number == 89
    sum +=1
    set_to(r,89) if i < lim
  elsif number == 1
    set_to(r,1) if i< lim
  else
    number = ARR[number]
    sum +=1 if number == 89
  end 
  # puts r.join(" -> ")
  puts i if i%100000 == 0
end

puts "Sum: #{sum}"
