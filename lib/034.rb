# encoding: utf-8
require "ruby-debug"

facts=[]
def fact(n)
        if n == 0
          1
        else
         n * fact(n-1)
        end
      end
0.upto(9) do |i|
  facts<<fact(i)
end

result =[]
%w(0 1 2 3 4 5 6 7 8 9).repeated_permutation(6).to_a.each do |p|
  sk=p.join("").to_i
  fact_sk=0
  sk.to_s.split("").each{|n|
   fact_sk+=facts[n.to_i]
  }
  if sk==fact_sk
    result<<sk
  end
end

puts result.inspect
puts result.slice(2..20).inject(0){|sum,sk| sum+sk}