require "#{File.dirname(__FILE__)}/common"
include Euler

# triangle= (x^2+x)/2=c => x^2+x=2c =>x^2+x-2c=0
# pentagonal= 3x^2-x-2c=0
# hexagonal = 2x^2-x-c=0
n=144
found=false
while !found
  h=n*(2*n-1)
  t=Euler.natural_root.call(1,1,-2*h)
  p=Euler.natural_root.call(3,-1,-2*h)
  if t && p
    found=true
    puts h
  end
  n+=1
end