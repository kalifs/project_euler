
pyt=lambda{|n|
  result=[]
  (n/2).downto(3) do |c|
    b_start=n-c-1
    lim=(c-n/2).abs
    lim=lim==0 ? 2 : lim
    (b_start).downto(lim) do |b|
      a=n-c-b
      nr=[a,b,c].sort
      if nr[0]**2+nr[1]**2==nr[2]**2 && a+b>c
        result<< nr 
      end
    end
  end
  return result.uniq
}
max_result=[]
best_n=0
values=Hash.new{|h,k| h[k]=k*120} # vajag tikai tos kas ir 120 reizinājumi
1.upto(10) do |n|
  sk=values[n]
  new_result=pyt.call(sk)
  if new_result.size>max_result.size
    max_result=new_result
    best_n=sk
  end
end
puts max_result.inspect
puts best_n

#
#[[15, 112, 113], [40, 96, 104], [48, 90, 102], [60, 80, 100]]
#240
##
#