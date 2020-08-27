require 'prime'
class Ex87

  @@primes=[]
 
  @@lim=50000000
  @@result=[]
  class << self

    def set_primes
      lim=Math.sqrt(@@lim)
      Prime.each{|p|
        @@primes<<p
        break if p>=lim
      }
    end
    def calculate
      set_primes
      arr2=@@primes.map{|p| p**2}
      arr3=@@primes.map{|p| p<369 ? p**3 : nil}.compact
      arr4=@@primes.map{|p| p<85 ? p**4 : nil}.compact
      puts "get arrays #{arr2.size*arr3.size*arr4.size} steps to go"
      counter=0
      arr2.each{|a2|
        arr3.each{|a3|
          arr4.each{|a4|
            n=a2+a3+a4
            if n<@@lim && !@@result[n]
              @@result[n]=true
              counter+=1
            end
          }
        }
      }
      counter
    end
  end
end

puts Ex87.calculate