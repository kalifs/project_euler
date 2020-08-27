module Euler
  @@fact=lambda{|n|
    result=1
    1.upto(n) do |i|
      result=result * i
    end
    return result
  }
  def self.fact
    @@fact
  end
  #repeated combinations
  @@repeated_comb_count=lambda{|n,k|
    a=n+k-1
    product=1
    0.upto(k-1) do |counter|
      product=product*(a-counter)
    end
    b=fact.call(k)
    return product/b
  }
  def self.repeated_comb_count
    @@comb_count
  end
  # pandigital, need template to be set
  @@template=%w(1 2 3 4 5 6 7 8 9)
  @@pandigital=lambda{|s|
    s.split("").sort==@@template
  }
  def pandigital
    @@pandigital
  end
  @@root=lambda{|a,b,c|
    d=b**2-4*a*c
    if d>=0
      d=Math.sqrt(d)
      x1=(-b.to_f+d)/(2*a)
      x2=(-b.to_f-d)/(2*a)
      return x1,x2
    else
      return nil,nil
    end
  }
  def self.root
    @@root
  end
  @@natural_root=lambda{|a,b,c|
    x1,x2=Euler.root.call(a,b,c)
    if x1
      x=x1>=0 ? x1 : (x2>=0 ? x2 : nil)
      x==x.to_i ? x.to_i : nil
    else
      nil
    end
  }
  def natural_root
    @@natural_root
  end

  def self.is_palindrome?(c)
    c=c.to_s
    if c.size%2==0
      part1=c.slice(0..c.size/2-1)
      part2=c.slice(c.size/2..c.size-1)
      part2.reverse!
    else
      part1=c[0,c.size/2+1]
      part2=c[c.size/2,c.size/2+1]
      part2.reverse!
    end
    if part1==part2
      return true
    end
    return false
  end
end

module ArabicRoman
  ROMAN_NUMBERS = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"

  }
  ARABIC_NUMBERS = [
    ["CM", 900],
    ["CD", 400],
    ["XC", 90],
    ["XL", 40],
    ["IX", 9],
    ["IV", 4],
    ["M", 1000],
    ["D", 500],
    ["C", 100],
    ["L", 50],
    ["X", 10],
    ["V", 5],
    ["I", 1]
  ]

  def self.to_roman(a_num)
    r_num = ""
    ROMAN_NUMBERS.keys.sort.reverse.each do |num|
      while a_num >= num 
        a_num = a_num - num 
        r_num << ROMAN_NUMBERS[num]
      end
    end
    return r_num
  end

  def self.to_arabic(r_num)
    a_num = 0
    while(r_num != "") do 
      a_digits = ARABIC_NUMBERS.detect{|num| r_num.match(/^#{num[0]}/) } 
      if a_digits
        a_num += a_digits[1]
        r_num = r_num.sub(/^#{a_digits[0]}/,"")
      end
    end
    a_num
  end
end