require 'prime'
good_primes=[]
primes=[]
truncable=lambda{|nr|
  l_nr=nr.to_s.split("")
  r_nr=nr.to_s.split("")
  1.upto(nr.to_s.size-1) do 
    l_nr.shift
    return false unless Prime.prime?(l_nr.join("").to_i,primes)
    r_nr.pop
    return false unless Prime.prime?(r_nr.join("").to_i,primes)
  end
  return true
}
Prime.each{|prime|
  primes<<prime
  if truncable.call(prime)
    good_primes<<prime
  end
  break if prime>800000
}
good_primes=good_primes.slice(4..good_primes.size-1)
puts good_primes.inspect
puts good_primes.inject(0){|sum,p| sum+p}