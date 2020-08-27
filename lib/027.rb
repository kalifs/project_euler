require 'prime'
primes=[]
Prime.each{|p|
  primes[p]=true
  break if p>2000000
}
f=lambda{|a,b|
  n=0
  while primes[n*n+a*n+b]
    n+=1
  end
  return n
}
puts "Start"
max_n=0
max_a=0
max_b=0
-999.upto(999) do |a|
  -999.upto(999) do |b|
    len=f.call(a,b)
    if len>max_n
      max_n=len
      max_a=a
      max_b=b
    end
  end
end

puts "#{max_n}: #{max_a}*#{max_b}=#{max_a*max_b}"