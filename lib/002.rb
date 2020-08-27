nr=[2]
sum=0
a=1
b=2
temp=0
while a<=4000000
  if (a+b)%2==0
    nr<<(a+b)
  end
  sum=a+b
  a=b
  b=sum
end
puts nr.inspect
puts nr.inject(0){|i,r| r+i}