require 'date'
_date=Date.new(1901,1,1)
end_date=Date.new(2000,12,31)
sundays=0
while _date!=end_date
  if _date.wday==0 && _date.day==1
    sundays+=1
  end
  _date+=1
end
puts sundays