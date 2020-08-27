require 'prime'

primes={}
Prime.each{|p|
  primes[:"p#{p}"]=true
  break if p>=1000000
}
puts "got primes"
is_circular=lambda{|n|
  n=n.split("")
  1.upto(n.size) do
    n=n.rotate
    value=n.join("").to_i
    return false unless primes[:"p#{value}"]
  end
  return true
}
results =[]
1.upto(1000000) do |nr|
  results<<nr if is_circular.call(nr.to_s)
end

puts results.inspect
puts results.size
