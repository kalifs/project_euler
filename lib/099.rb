@@nrs=[]
f = File.open(File.join(File.dirname(__FILE__),'data','99_data.txt'), "r")
f.each_line do |line|
  base,exp=*line.split(",")
  @@nrs<<[base.to_i,exp.to_i]
end

exp_to_log=lambda{|base,exp|
  exp*Math.log(base)
}

max_result=0
max_line=0
@@nrs.each_with_index{|nr,index|
  new_nr=exp_to_log.call(nr.first,nr.last)
  if new_nr>max_result
    max_result=new_nr
    max_line=index+1
  end
}
puts max_line