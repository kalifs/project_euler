#Spiral
# Diognal
class Ex28
  @@a=[]
  
  @@x_u=0
  @@x_d=0
  @@y_u=0
  @@y_d=0
  @@x=0
  @@y=0
  @@d=:l
  def self.get_dir
    if @@d==:l
      if @@x-1>=@@x_d
        @@x-=1
      else
        @@y_d+=1
        @@d=:d
      end
    elsif @@d==:d
      if @@y+1<=@@y_u
        @@y+=1
      else
        @@x_d+=1
        @@d=:r
      end
    elsif @@d==:r
      if @@x+1<=@@x_u
        @@x+=1
      else
        @@y_u-=1
        @@d=:u
      end
    elsif @@d==:u
      if @@y-1>=@@y_d
        @@y-=1
      else
        @@x_u-=1
        @@d=:l
      end
    end
  end
  def self.init(lim)
    1.upto(lim) do
      @@a<<[]
    end
    @@x_u=lim-1
    @@y_u=lim-1
    @@x=lim-1
  end
  
  def self.calculate(lim)
    init(lim)
    (lim*lim).downto(1) do |i|
      @@a[@@y][@@x]=i
      if get_dir().is_a?(Symbol)
        get_dir
      end
    end
    @@a
  end

  def self.sum_d(lim)
    lim=lim-1
    d1=0
    d2=0
    0.upto(lim) do |i|
      d1+=@@a[i][i]
      d2+=@@a[i][lim-i]
    end
    d1+d2-1
  end
end

Ex28.calculate(1001)#.each{|e|
#  e.each{|e2|
#    print e2.to_s+(" "*(8-e2.to_s.size))
#  }
#  puts
#}
puts Ex28.sum_d(1001)
