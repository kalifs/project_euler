
def a
  results =[]
  999.downto(100) do |a|
    999.downto(100) do |b|
      c=a*b
      c=c.to_s
      if c.size%2==0
        part1=c.slice(0..c.size/2-1)
        part2=c.slice(c.size/2..c.size-1)
        part2.reverse!
        if part1==part2
          results<<c
        end
      end
    end
  end
  results.sort{|a,b| a<=>b}.uniq
end

puts a().inspect