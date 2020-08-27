class Ex22
  @@abc=%w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @@words=[]
 
  class << self
    def open_file
      f = File.open(File.join(File.dirname(__FILE__),'data','22_names.txt'), "r")
      f.each_line do |line|
        @@words=line.split(",").map{|el| el.gsub('"',"")}
      end
      @@words.sort!
    end
    def word_value(word)
      word.split("").inject(0){|sum,letter| sum+@@abc.index(letter)+1}
    end

    def calculate
      open_file
      result=0
      @@words.each_with_index{|word,index|
        result+=(word_value(word)*(index+1))
      }
      result
    end
  end
end
#puts Ex22.open_file
puts Ex22.calculate