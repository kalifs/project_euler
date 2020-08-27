#http://placementsindia.blogspot.com/2007/10/last-non-zero-digit-of-factorial.html

def dec2five(n)
  r=[]
  while n>1
    a=n%5
    r<<a
    n=n/5
  end
  r<<n
  r.reverse.join("").gsub(/^0/,"").to_i
end

def i(n)
  i=0
  while n>1
    n=n/2
    i+=1
  end
  i
end

def k(n)
  k=0
  while n>1
    n=n/5
    k+=1
  end
  k
end

def f(i)
  
end
puts i(7)
puts k(7)