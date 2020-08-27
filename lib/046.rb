require "prime"

primes={}
Prime.each do |p|
  primes[:"p#{p}"]=true
  break if p>10000
end

sq=[]
1.upto(100) do |i|
  sq << i**2*2
end

result=0
(21..1000000).step(2) do |sk|
  unless primes[:"p#{sk}"]
    good=sq.detect{|s| 
      tp=sk-s
      primes[:"p#{tp}"]
    }
    unless good
      result= sk 
      break
    end
  end
end
puts result


