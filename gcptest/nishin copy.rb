# 標準入力から値を受け取り
# 二進数に変換して出力するスクリプト
def to_binary(real_number)
    integer_part = real_number.to_i
    fractional_part = real_number - integer_part
  
    # 整数部分を二進数に変換
    binary_integer_part = integer_part.to_s(2)
  
    # 小数部分を二進数に変換
    binary_fractional_part = ""
    20.times do # 20回の反復で精度を制限
      fractional_part *= 2
      if fractional_part >= 1
        binary_fractional_part += "1"
        fractional_part -= 1
      else
        binary_fractional_part += "0"
      end
    end
  
    "#{binary_integer_part}.#{binary_fractional_part}".sub(/\.0+\z/, '')
  end
  
  def main
    puts "Enter a number: "
    user_input = gets.chomp
    if user_input =~ /^[+-]?[0-9]+\.?[0-9]*$/
      real_number = user_input.to_f
      puts "You entered a real number: #{user_input}"
      puts "Binary: #{to_binary(real_number)}"
    else
      puts "You entered a non-real number: #{user_input}"
    end
  end
  
  main()
  