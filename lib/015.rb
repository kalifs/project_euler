def fact(n)
  if n == 0
    1
  else
    n * fact(n-1)
  end
end
# ir 20 uz leju un 20 pa labi kopā 40 gājieni, uz leju var noiet 20 katrā reizē
# kā pa labi iet nav svarīg, tāpēc kombinācijas
# http://mathforum.org/library/drmath/view/66728.html
puts fact(40)/(fact(20)*fact(40-20))
