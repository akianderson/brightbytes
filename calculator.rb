require 'pry'
class Calculator
  def add(num_string)
    delimeter = delimeter(num_string)

    if check_input(delimeter, num_string)
      numbers = num_string.split(",").map(&:to_i)
      total = numbers.inject{|sum, x| sum += x}

      puts "#{numbers.join(' + ')} =  #{total}"
    else
      puts "invalid input"
    end
  end

  def delimeter(num_string)
    punct = Regexp.new(/[[:punct:]]/)
    if (num_string[0..1] == "//" and !punct.match(num_string).nil? )
      del = num_string[2]
      num_string.reverse!.chop!.chop!.chop!.reverse!
      num_string.gsub!("#{del}",",")
      return del
    else
      num_string.gsub!("\n", ",")
      return "[:space:]"
    end
  end

  def check_input(delimeter, num_string)
    regex = Regexp.new("[[[:digit:]]+[,]*[#{delimeter}]*]+")
  
    #check for trialing spaces and new lines then a pattern match
    if !(num_string[num_string.length-1] =~ /[[:space:]]/).nil?
      return false
    elsif num_string == regex.match(num_string).to_s
      return true
    else
      return false
    end
  end
end
