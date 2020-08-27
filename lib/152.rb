arr=[]
2.upto(80) do |n|
  arr<<Rational(1,n**2)
end
lim=Rational(1,2)
all=[]
counter=0
arr.each_with_index{|a,index|
  s=a
  res=[]
  (index+1).upto(arr.size-1) do |i|
    b=arr[i]
    if s+b>lim
      next
    elsif s+b==lim
      res<<b
      all<<res
      counter+=1
      break
    else
      res<<b
      s+=b
    end
  end
}


