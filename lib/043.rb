digits=(0..9).to_a
divis=[2,3,5,7,11,13,17]
numbers=digits.permutation(10).to_a.map{|e| e.join("")}
nr=lambda{|number,start|
  number.to_s.slice(start-1,3).to_i
}
is_divisable=lambda{|number,start|
  number%divis[start-2]==0
}
puts "Start.."
result=[]
numbers.each{|n|
  ns=nil
  2.upto(8) do |i|
    ns=n
    part= nr.call(ns,i)
    unless is_divisable.call(part,i)
      ns=nil
      break
    end
  end
  result<<n.to_i if ns
}
puts result.size
puts result.inject(0){|sum, el| sum+el}

