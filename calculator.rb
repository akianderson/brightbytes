require 'pry'
class Calculator
  def add(num_string)
    if check_input(num_string)
      numbers = num_string.gsub("\n",",").split(",").map(&:to_i)
      total = numbers.inject{|sum, x| sum += x}

      puts "#{numbers.join(' + ')} =  #{total}"
    else
      puts "invalid input"
    end
  end

  def check_input(num_string)
    regex = Regexp.new(/[[[:digit:]]+[,][[:space:]]*]+/)
    if num_string == regex.match(num_string).to_s
      return true
    else
      return false
    end
  end
end
