require 'prime'
class Ex23

  @@abundant=[]
  @@a_sums={}
  class << self

    def is_abundant?(n)
      Prime.prime_division(n).inject(1){|prod,arr|
        value=((arr[0]**(arr[1]+1)-1).to_f/(arr[0]-1).to_f).to_i
        prod*value
      }-n>n
    end

    def set_abundant(n)
      if is_abundant?(n)
        @@abundant<<n
        @@abundant.each do |n1|
          @@a_sums[:"n#{n1+n}"]=true
        end
        #@@a_sums=@@abundant.repeated_combination(2).to_a.map{|arr| arr[0]+arr[1]}
      end
    end

    def is_sum?(n)
      @@a_sums[:"n#{n}"]
    end

    def calculate(lim)
      result=[]
      1.upto(lim) do |number|
        set_abundant(number)
        result << number unless is_sum?(number)
      end
      result
    end

    def nrs
      @@a_sums.sort.inspect
    end
  end
end


puts Ex23.calculate(28123).inject(0){|s,n| s+n}
