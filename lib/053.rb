require "#{File.dirname(__FILE__)}/common"
include Euler

fact=[1]
1.upto(100) do |i|
  fact[i]=Euler.fact.call(i)
end

comb=lambda{|n,r|
  fact[n]/(fact[r]*fact[n-r])
}

counter=0
100.downto(2) do |n|
  n.downto(2) do |r|
    if comb.call(n,r)>1000000
      counter+=1
    end
  end
end
puts counter