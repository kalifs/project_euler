require 'linguistics'
Linguistics::use( :en )
len=0
1.upto(1000) do |number|
  len+=Linguistics::En.numwords(number).gsub(/[\s-]/,"").size
end
puts len

