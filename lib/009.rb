sqr=(1..425).map{|i| i*i}
good=sqr.combination(3).to_a.detect{|arr|
 # puts arr.inspect
   (arr[0]+arr[1]==arr[2]) &&
    Math.sqrt(arr[0])+Math.sqrt(arr[1])+Math.sqrt(arr[2])==1000
}
good.map!{|nr| Math.sqrt(nr)}
puts "#{good[0]}x#{good[1]}x#{good[2]}=#{good[0]*good[1]*good[2]}"