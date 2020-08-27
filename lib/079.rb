require "#{File.dirname(__FILE__)}/common"
include Euler

@@nrs=[]
f = File.open(File.join(File.dirname(__FILE__),'data','79_data.txt'), "r")
f.each_line do |line|
  @@nrs<<line.strip if line.to_i.to_s==line.strip
end
code=[]
@@nrs.each{|n|
  code+=n.split("")
}
code.uniq!

is_good=lambda{|comb|
  @@nrs.each{|nr|
    d=nr.split("")
    i1,i2,i3=comb.index(d[0]),comb.index(d[1]),comb.index(d[2])
    if !(i1<i2 && i2<i3)
      return false
    end
  }
  return true
}

result=nil
code.permutation(code.size).to_a.each{|comb|
  if is_good.call(comb)
    result=comb
    break
  end
}
puts result.join("")