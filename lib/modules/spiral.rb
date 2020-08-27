class Spiral
  

 
  def initialize(side_len,clockwise=true)
    @clockwise=clockwise
    @side_len=side_len
    init_vars()
    1.upto(@side_len) do
      @a<<[]
    end
    @x_u=@side_len-1
    @y_u=@side_len-1
    @x=@side_len-1
    @y=@clockwise ? 0 : @side_len-1
    self.calculate
  end

  def inspect
    result=""
    size=@a.last.last.to_s.size
    @a.each{|r|
      row=""
      lim=row.size-1
      r.each_with_index{|e,i|
        sep=" "*(size-e.to_s.size+1) unless i==lim
        row<<(e.to_s+sep)
      }
      result<<(row+"\n")
    }
    result
  end
  
  def init_vars
    @a=[]

    @x_u=0
    @x_d=0
    @y_u=0
    @y_d=0
    @x=0
    @y=0
    @d=:l
  end
  def get_dir
    if @d==:l
      if @x-1>=@x_d
        @x-=1
      else
        if @clockwise
          @y_d+=1
        else
          @y_u-=1
        end
        @d=@clockwise ? :d : :u
      end
    elsif @d==:d
      if @y+1<=@y_u
        @y+=1
      else
        if @clockwise
          @x_d+=1
        else
          @x_u-=1
        end
        @d=@clockwise ? :r : :l
      end
    elsif @d==:r
      if @x+1<=@x_u
        @x+=1
      else
        if @clockwise
          @y_u-=1
        else
          @y_d+=1
        end
        @d=@clockwise ? :u : :d
      end
    elsif @d==:u
      if @y-1>=@y_d
        @y-=1
      else
        if @clockwise
          @x_u-=1
        else
          @x_d+=1
        end
        @d=@clockwise ? :l : :r
      end
    end
  end

  def calculate()
    (@side_len**2).downto(1) do |i|
      @a[@y][@x]=i
      if get_dir().is_a?(Symbol)
        get_dir
      end
    end
  end

  def diagonal_len
    @side_len*2-1
  end

  def center
     @side_len/2
  end
  def diagonals(combine=false)
    lim=@side_len-1
    center=self.center
    d1=[]
    d2=[]
    0.upto(lim) do |i|
      d1<<@a[i][i]
      d2<<@a[i][lim-i] unless lim-i==center
    end
    if combine
      d1+d2
    else
      return d1,d2
    end
  end
  
end