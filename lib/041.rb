require 'prime'

max_primes=[]
4.upto(8) do |count|
  template=(1..count).to_a
  pan_nrs=template.permutation(count).to_a
  pan_nrs.reverse.each{|arr|
    nr=arr.join("").to_i
    if Prime.prime?(nr)
      max_primes<<nr
      break
    end
  }
end

puts max_primes.inspect

