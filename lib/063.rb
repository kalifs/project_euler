
result=[]
1.upto(10) do |n|
  1.upto(21) do |pak|
    sk=(n**pak).to_s
    if sk.size==pak
      result<<[n,pak,sk]
    end
  end
end

puts result.size