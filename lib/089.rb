#Roman numbers; Convertation both ways
require File.expand_path("common")

sum = 0
File.open(File.expand_path("data/89_numbers.txt")) do |file|
  file.lines.each do |line|
    original_r_num = line.gsub(/\W/,"")
    a_num = ArabicRoman.to_arabic(original_r_num)
    converted_r_num = ArabicRoman.to_roman(a_num)
    sum += original_r_num.size - converted_r_num.size
  end
end

puts "Sum: #{sum}"

