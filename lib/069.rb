require 'prime'
#
# Var izrēķināt vienkārši atrodot visu mazāko pirmskaitļu reizinājumu, kas nepārsniedz robežu N
# bet piereizinot nākamo jau pārsniedz, jo n/phi(n) būs vislielakais, ja phi(n) būs vismazākais,
# kas tāds būs, ja sastāvēs no vismazākajiem pirmskaitļiem
# n(k)< N < n(k+1)
# n(k)< 1000000 < n(k+1)
# 2*3*5*7*11*13*17=510510, kad k=7
@@primes=[]
Prime.each{|prime|
  @@primes<<prime
  break if prime>1000000
}
puts "Got primes"
prime_factors=lambda{|nr|
  Prime.prime_division(nr,@@primes).map{|arr| arr[0]}
}

euler_count=lambda{|nr|
  factors=prime_factors.call(nr)
  result=nr
  factors.each{|f|
    result=result*((f-1).to_f/f.to_f)
  }
  return result
}

max_result=0
good_n=0
1.upto(1000000) do |n|
  result=n/euler_count.call(n)
  if result>max_result
    max_result=result
    good_n=n
  end
end

puts good_n