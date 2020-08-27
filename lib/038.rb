require "#{File.dirname(__FILE__)}/common"
include Euler
max_pan=0
max_sk=0
1.upto(10000) do |sk|
  nr="#{sk}"
  multi=2
  while nr.size<9
    p=sk*multi
    nr<<p.to_s
    multi+=1
  end
  if nr.size==9
    if Euler.pandigital.call(nr) && nr.to_i>max_pan
      max_pan=nr.to_i
      max_sk=sk
    end
  end
end

puts max_sk
puts max_pan