require 'prime'
# Spiral, diagonal
class Ex58
  @@primes={}
  @@p=[2]
  class << self

    def a n,l
      (2*n-l)**2
    end

    def b a,n,l
      a-(2*n-l-1)
    end

    def c a,n,l
      a-2*(2*n-l-1)
    end

    def d a,n,l
      a-6*(n/2)#((2*n-l-1)*(l-1))/2
    end

    def check_prime(p)
      if Prime.prime?(p)
        return 1
      else
        return 0
      end
    end
    
    def prime_count l
      primes=0
      n=l
      #l.downto(l/2+1) do |n|
      new_a=self.a(n,l)
      new_c=self.c(new_a,n,l)
      new_d=self.d(new_a,n,l)
      new_b=self.b(new_a,n,l)
      primes+=self.check_prime(new_d)
      primes+=self.check_prime(new_c)
      primes+=self.check_prime(new_b)
      # end
      primes
    end
    
    def calculate
      puts "Start calculate"
      ratio=1
      s=1
      len=s
      p_count=0
      while ratio>0.1
        len+=2
        p_count+=self.prime_count(len)
        ratio=p_count.to_f/(2*len.to_f-1).to_f
        #break if len>s+20000
        if (len-1)%5000==0
          puts "--#{len} (#{ratio})"
        end
      end
      len
    end
  end
end

#counter=3
#while counter<100
#  puts Ex58.prime_count(counter)
#  counter+=2
#end
#a=Ex58.a(1000,1000)
#puts Ex58.b(a,1000,1000)
puts Ex58.calculate

