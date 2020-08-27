# nauda, rekursija
def f_1(n)
  return 1
end
def f_2(x)
  return f_2(x-2) + f_1(x) if x>=0
  return 0
end
def f_5(x)
  return f_5(x-5) + f_2(x) if x>=0
  return 0
end
def f_10(x)
  return f_10(x-10) + f_5(x) if x>=0
  return 0
end
def f_20(x)
  return f_20(x-20) + f_10(x) if x>=0
  return 0
end
def f_50(x)
  return f_50(x-50) + f_20(x) if x>=0
  return 0
end
def f_100(x)
  return f_100(x-100) + f_50(x) if x>=0
  return 0
end
def f_200(x)
  return f_200(x-200) + f_100(x) if x>=0
  return 0
end


puts f_200(20)