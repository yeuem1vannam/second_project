def f1
  i = 0
  while i <= 2 
    puts "F1 loop #{i+1} start at #{Time.now}"
    sleep 2
    puts "F1 loop #{i+1} end at #{Time.now}"
    i = i + 1
  end
end
def f2
  j = 0
  while j <= 2 
    puts "F2 loop #{j+1} start at #{Time.now}"
    sleep 2
    puts "F2 loop #{j+1} end at #{Time.now}"
    j = j + 1
  end
end
def multithreaded

  time_start = Time.now
  puts "Started at #{time_start}"
  t1 = Thread.new{ f1() }
  t2 = Thread.new{ f2() }
  t1.join
  t2.join
  time_end = Time.now
  puts "End at #{time_end}"
  puts "Total time taken: #{time_end.sec - time_start.sec} second(s)"
end
def nonthreaded
  time_start = Time.now
  puts "Started at #{time_start}"
  t1 = f1()
  t2 = f2()
  time_end = Time.now
  puts "End at #{time_end}"
  puts "Total time taken: #{time_end.sec - time_start.sec} second(s)"
end

# Main
puts "Input"
puts "1 = multithreaded"
puts "2 = nonthreaded"
value = gets.chomp
if value == "1"
  multithreaded()
else if value == "2"
  nonthreaded()
else
  puts "Invalid input"
end
end
