
p=lambda{|n|
  n*(3*n-1)/2
}

root=lambda{|c|
  d=1+(12*c*2)
  if d>=0
    d=Math.sqrt(d)
    x1=(1.0+d)/6.0
    x2=(1.0-d)/6.0
    x=x1>0 ? x1 : (x2>0 ? x2 : nil)
    if x && x==x.to_i
      x.to_i
    else
      nil
    end
  else
    nil
  end
}

ps=[]
1.upto(10000) do |i|
  new_p=p.call(i)
  ps.each{|old_p|
    r2=root.call((new_p-old_p).abs)
    r1=root.call(new_p+old_p) if r2
    if r1 && r2
      puts "#{new_p} #{old_p} #{r1} #{r2}"
      return false
    elsif r2
      puts r1
    end
  }
  ps<<new_p
end