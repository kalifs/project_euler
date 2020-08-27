require File.expand_path(File.dirname(__FILE__)+'/modules/poker_hand')

@@games=[]
f = File.open(File.join(File.dirname(__FILE__),'data','54_data.txt'), "r")
f.each_line do |line|
  cards=line.split(" ")
  game=[cards.slice(0..4),cards.slice(5..9)]
  @@games<<game
end

play=lambda{|game|
  hand1=Hand.new(*game[0])
  hand2=Hand.new(*game[1])
  hand1>hand2
}

wons=0

#@@games.each{|game|
#  if play.call(game)
#    wons+=1
#  end
#}
#puts wons

h1=Hand.new(*%w(8C TS TC 9H 4S))
h2=Hand.new(*%w(7D 5S 5D 3S AC))
puts h1.best_combination
puts h2.best_combination