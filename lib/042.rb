require "#{File.dirname(__FILE__)}/common"
include Euler
@@abc=%w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
@@words=[]
f = File.open(File.join(File.dirname(__FILE__),'data','42_names.txt'), "r")
f.each_line do |line|
  @@words=line.split(",").map{|el| el.gsub('"',"")}
end
@@words.sort!
word_value=lambda{|word|
  word.split("").inject(0){|sum,letter| sum+@@abc.index(letter)+1}
}
#0,5n^2+0.5-{value}=0

result=0
@@words.each{|word|
  value=word_value.call(word)
  if Euler.natural_root.call(0.5,0.5,value)
    result+=1
  end
}
puts result
