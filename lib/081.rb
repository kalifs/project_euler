# Path; Matrix; Sum
require 'debugger'

matrix = []

File.open(File.expand_path("data/81_matrix.txt")) do |file|
  file.lines.each do |line|
    matrix << line.scan(/\d+/)
  end
end

sum = 0
row = 0
col = 0
next_step = true
count = 0
while(next_step) do 
  count +=1
  num = matrix[row][col].to_i
  sum += num
  next_in_row = matrix[row][col + 1] rescue nil
  next_in_col = matrix[row + 1][col] rescue nil
  if next_in_row || next_in_col
    if next_in_row.to_i < next_in_col.to_i && next_in_row
      col +=1
    elsif next_in_col.to_i < next_in_row.to_i && next_in_col
      row +=1
    elsif next_in_row
      col +=1 
    elsif next_in_col
      row += 1
    end
  else
    next_step = false
  end
end

puts count
puts "Sum: #{sum}"