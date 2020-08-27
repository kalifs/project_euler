n=[]
d=[]
10.upto(99) do |a|
  (a+1).upto(99) do |b|
    if a==49 && b==98
      aasdf=1
    end
    a_p=a.to_s.split("")
    b_p=b.to_s.split("")
    div_1=Rational(a,b)
    common_d=a_p & b_p
    if common_d.size==1 && common_d[0]!="0"
      a2=a.to_s.gsub(common_d[0],"").to_i
      b2=b.to_s.gsub(common_d[0],"").to_i
      if b2!=0 && div_1==Rational(a2,b2)
        n<<a
        d<<b
        puts "#{a}/#{b} == #{a2}/#{b2}"
      end
    end
  end
end

n=n.inject(1){|p,el| p*el}
d=d.inject(1){|p,el| p*el}
puts Rational(n,d)