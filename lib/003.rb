primes=[]
nr=600851475143
current=2
while current<=Math.sqrt(nr)
  if nr%current==0
    primes<<current
    nr=nr/current
    puts nr
    current=2
  elsif current==2
    current+=1
  else
    current+=2
  end
end
primes<<nr
primes.sort{|a,b| a<=>b}
puts primes.inject(1){|i,r| r*i}
puts primes.inspect