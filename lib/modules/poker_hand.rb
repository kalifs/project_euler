class Hand
  include Comparable
  attr_accessor :cards
  def initialize *cards
    self.cards=[]
    cards.each{|card|
      self.cards<<Card.new(card)
    }
    self.cards.sort!
  end

  def <=> other_hand
    best1=self.best_combination
    best2=other_hand.best_combination
    
    if (best1==best2)
      (self.cards.size-1).downto(0) do |i|
        unless self.cards[i]==other_hand.cards[i]
          return self.cards[i]<=>other_hand.cards[i]
        end
      end
    end
    return best1<=>best2
  end

  def best_combination
    if c=self.royal_flush?
      1000
    elsif c=self.straight_flush?
      c.value+800
    elsif c=self.four_of_kind?
      c.value+700
    elsif c=self.full_house?
      c.value+600
    elsif c=self.flush?
      c.value+500
    elsif c=self.straight?
      c.value+400
    elsif c=self.three_of_kind?
      c.value+300
    elsif c=self.two_pairs?
      c.value+200
    elsif c=self.one_pair?
      c.value+100
    else
      self.cards.last.value
    end
  end

  def inspect
    self.cards.inspect
  end

  def high_card
    self.cards.last
  end

  def pairs
    i=0
    pairs=[]
    while i<=self.cards.size-1
      is_in=pairs.detect{|p| p[0]==self.cards[i]}
      if is_in
        pairs.delete(is_in)
      end
      if self.cards[i]==self.cards[i+1] && !is_in
        pairs<<[self.cards[i],self.cards[i+1]]
        i+=2
      else
        i+=1
      end
    end
    pairs
  end

  def one_pair?
    p=self.pairs
    if p.size>=1
      p.sort{|a,b| a[0]<=>b[0]}.last.last
    end
  end

  def two_pairs?
    p=self.pairs
    if p.size>=2
      p.sort{|a,b| a[0]<=>b[0]}.last.last
    end
  end

  def three_of_kind?
    0.upto(self.cards.size-3) do |i|
      if self.cards[i]==self.cards[i+1] && self.cards[i+1]==self.cards[i+2]
        return self.cards[i]
      end
    end
    return false
  end

  def straight?
    s_cards=self.cards.dup
    if s_cards.last.is_ace? && s_cards[s_cards.size-2].value==4
      s_cards.pop
      start=1
    else
      start=s_cards.first.value
    end
    good=true
    1.upto(s_cards.size-1) do |i|
      unless s_cards[i+(start==1 ? -1 : 0)].value==start+i
        good=false;break;
      end
    end
    return good ? s_cards.last : nil
  end

  def flush?
    good=true
    0.upto(self.cards.size-2) do |i|
      unless self.cards[i].same_suit?(self.cards[i+1])
        good=false;break;
      end
    end
    return good ? self.cards.last : nil
  end

  def full_house?
    tok=three_of_kind?
    p=one_pair?
    if tok && p && p!=tok
      return tok
    end
  end

  def four_of_kind?
    part1=self.cards.slice(0..3)
    part2=self.cards.slice(1..4)
    all_same=lambda{|arr|
      start=arr[0]
      1.upto(arr.size-1) do |i|
        return false unless start==arr[i]
      end
      return true
    }
    if all_same.call(part1)
      return part1.first
    elsif all_same.call(part2)
      return part2.first
    end
  end

  def straight_flush?
    s=straight?
    if s && flush?
      return s
    end
  end

  def royal_flush?
    straight_flush? && self.cards.first.value==10
  end
end

class Card
  @@suits=["H","C","S","D"]
  @@values=["2","3","4","5","6","7","8","9","T","J","Q","K","A"]
  include Comparable
  attr_accessor :suit,:real_value
  attr_reader :value,:card
  def initialize(card)
    @card=card
    if card.is_a?(Hash)
      self.suit=card[:suit].to_s.upcase
      self.value=get_value(card[:value])
      self.real_value=card[:value]
    else
      parts=card.split("")
      self.value=get_value(parts[0])
      self.real_value=parts[0]
      self.suit=parts[1].to_s.upcase
    end
  end

  def value=(value)
    begin
      @value=value+2
    rescue
      puts "#{@card} #{ value}"
      raise
    end
  end

  def <=> other_card
    self.value <=> other_card.value
  end

  def same_suit?(other_card)
    self.suit==other_card.suit
  end

  def get_value(val)
    @@values.index(val)
  end

  def inspect
    "#{self.real_value}#{self.suit}"
  end

  def is_ace?
    self.value==@@values.size+1
  end
end