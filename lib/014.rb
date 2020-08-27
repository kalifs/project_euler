
def chain_len(number)
  len=1
  f=lambda{|nr|
    if nr%2==0
      nr/2
    else
      3*nr+1
    end
  }
  n=number
  while n!=1
    n=f.call(n)
    len+=1
  end
  len
end

result=[0,0] # number,len
1.upto(1000000) do|nr|
  l=chain_len(nr)
  if l>result[1]
    result=[nr,l]
  end
end

puts result.inspect