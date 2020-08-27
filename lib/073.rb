# 21 23 27 29
# 23-32
# 25 - 35 -> 25 29 31 35
# (ul+1-ll-1)-(ul-ll)/each_divisor of n
# 9-6=3-(1/3)=3-1=2
# n-(14-11)=5-(3/5)-==4
# 10-(8/5+8/2)=10-1+4=4
# 10/5+10/2=2+5=10/2=5/5=1=10-5+1
# 11-(32-23)=11-9/11=10
# 30/5+30/3+30/2=15/3=5/2=2=15+5+2=22
# 60..90=30
# 61 67 71 73 77 79 83 89
# Der skaitļi tikai kas ir robežās no n*2-n*3, jo pārējie ir vai nu lielāki vai mazāki par vajadzīgo
# Neder tie ar kuriem dalās n piemēram 3/18, jo 18 dalās ar 3
# N nevar būt liekāks par lim/3. Piemēram, lim=10 un n=4 tas nozīmē, ka vajadzīgie skaitļi ir no
# 4/8 - 4/12, kas vairs nede
require 'prime'
bound_count=lambda{|n|
   div=Prime.prime_division(n).map{|arr| arr[0]}.sort
   count=0
   r=n
   div.each{|d|
    r=n/d-(count/d)
    count+=r
   }
   n-count
}
puts bound_count.call(4)
counter=0
2.upto(6000-1) do |n|
  if n*2>12000
    sk=12000-n*2
  else
    sk=n
  end
  counter+=bound_count.call(sk)
end

puts counter