require 'prime'
sum=0
count=0
all={}
Prime.each{|prime|
  all[:"p_#{prime}"]=true
  break if prime>1000000
}
primes=[]
Prime.each{|prime|
  primes << prime 
  break if prime >1000
}
f_prime=lambda{|i|
  sum=primes[i]
  p_count=1
  while all[:"p_#{sum}"].nil?
    i+=1
    p_count+=1
    sum+=primes[i]
  end
  return [sum,primes[i],p_count]
}
results=[]
primes.each_with_index do |p,i|
  r=f_prime.call(i)
  results<<r
  puts r.inspect 
end
