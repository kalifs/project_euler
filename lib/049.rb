require 'prime'

perm_primes=lambda{|perms|
  perms.select{|p| Prime.prime?(p) && p.to_s.size==4}
}
# 1,2,4,5,7
progress=lambda{|primes|
  diffs={}
  0.upto(primes.size-1) do |i1|
    (i1+1).upto(primes.size-1) do |i2|
      diff=primes[i2]-primes[i1]
      n=:"p#{diff}"
      unless diffs[n]
        diffs[n]=[primes[i1],primes[i2]]
      else
        if diffs[n].include?(primes[i1])
          diffs[n]<<primes[i2]
        end
      end
    end
  end
  diffs.select{|k,v|
    v.size>=3
  }
}
result=[]
Prime.each{|prime|
  if prime>1000 && prime<5000
    perms=prime.to_s.split("").permutation(4).to_a.map{|arr| arr.join("").to_i}.uniq.sort
    pp=perm_primes.call(perms)
    if pp.size>=3
      prog=progress.call(pp)
      unless prog.empty?
        result<<prog.values.first unless result.include?(prog.values.first)
      end
    end
  end
  break if prime>5000
}
result.each{|prog|
  puts prog.inject(""){|c,nr| c+nr.to_s}
}
