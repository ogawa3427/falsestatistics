def gyaku(file)
  content = File.read(file).reverse
  File.write(file, content)
end

def add(file1, file2)
  gyaku(file1)
  gyaku(file2)

  content1 = File.read(file1)
  content2 = File.read(file2)

  flag = 0
  result = ""

  [content1.length, content2.length].max.times do |i|
    char1 = content1[i] || "0"
    char2 = content2[i] || "0"

    sum = char1.to_i + char2.to_i + flag

    if sum < 10
      result << sum.to_s
      flag = 0
    elsif sum == 10
      result << "0"
      flag = 1
    else
      sum -= 10
      result << sum.to_s
      flag = 1
    end
  end

  result << flag.to_s unless flag.zero?

  File.write("rawout", result.reverse)
  puts File.read("rawout")
end

def sub
  puts "sub"
end

def mul
  puts "mul"
end

def div
  puts "div"
end

if ARGV.length == 3
  File.write("farg", ARGV[0])
  File.write("sarg", ARGV[1])

  case ARGV[2]
  when "+"
    add("farg", "sarg")
  when "-"
    sub
  when "*"
    mul
  when "/"
    div
  else
    puts "error! allc.rb (val) (val) (ope)"
  end

  File.delete("farg")
  File.delete("sarg")
else
  puts "error! allc.rb (val) (val) (ope)"
end
