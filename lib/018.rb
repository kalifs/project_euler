class Ex18
  data=%(75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)
  d2=%(3
  7 4
  2 4 6
  8 5 9 3)
  @@triangle=data.split("\n").map{|row| row.split(" ").map{|el| el.to_i}}

  class << self

    def set_data(d)
      @@triangle=d.split("\n").map{|row| row.split(" ").map{|el| el.to_i}}
    end

    def value(r,c)
      @@triangle[r][c]
    end
    def decide(row,index)
      if row[index]>row[index+1].to_i
        return row[index],index
      else
        return row[index+1].to_i,index+1
      end
    end

    def next_step(row_index,index)
      next_row=@@triangle[row_index+1] if row_index+1<@@triangle.size
      if next_row
        [next_row[index],next_row[index+1]]
      else
        nil
      end
    end

    def next_steps(row_index,index)
      row_one=next_step(row_index,index)
      if row_one
        sum1=if row_two_1=next_step(row_index+1,index)
          max_sum(row_one[0],row_two_1)
        end
        sum2=if row_two_2=next_step(row_index+1,index+1)
          max_sum(row_one[1],row_two_2)
        end
        if sum1 && sum2
          if sum1[0]>sum2[0]
            return [0,sum1[1]]
          else
            return [1,sum2[1]]
          end
        elsif sum1
          [0,sum1[1]]
        elsif sum2
          [0,sum2[1]]
        else
          if row_one[0]>row_one[1]
            [0,nil]
          else
            [1,nil]
          end
        end
      end
    end

    def max_sum(nr,row2)
      if nr+row2[0]>nr+row2[1]
        return [nr+row2[0],0]
      else
        return [nr+row2[1],1]
      end
    end

    def calculate
      sum=0
      row_i=0
      col_i=0
      r=[]
      while steps=Ex18.next_steps(row_i,col_i)
        r<<Ex18.value(row_i,col_i)
        sum+=Ex18.value(row_i,col_i)
        row_i+=1
        col_i+=steps[0]
      end
      r<<Ex18.value(row_i,col_i)
      sum+=Ex18.value(row_i,col_i)
      puts r.inspect
      puts sum
    end
  end
end

