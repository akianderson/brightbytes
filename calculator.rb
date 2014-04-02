require 'pry'
class Calculator
  @@negatives = []

  def add(num_string)
    return 0 if num_string == ""
    return num_string.to_i if num_string.size == 1

    delimeter = delimeter(num_string)

    if check_input(delimeter, num_string)
      numbers = num_string.split(",").map(&:to_i)
      remove_negatives(numbers)
      return numbers.inject{|sum, x| sum += x}
    else
      raise ArgumentError, "invalid input"
    end
  end

  def remove_negatives(numbers)
    numbers.each_with_index do |n, i|
      if n.to_s =~ /^-/
        numbers.delete_at(i)
        @@negatives << n
        puts "negatives not allowed: #{@negatives}"
      end
    end
  end

  def delimeter(num_string)
    punct = Regexp.new(/[[:punct:]]/)
    if (num_string[0..1] == "//" and !punct.match(num_string).nil? )
      del = num_string[2]
      num_string.reverse!.chop!.chop!.chop!.reverse!
      num_string.gsub!("#{del}",",").gsub!("\n", "")
      return del
    else
      num_string.gsub!("\n", ",")
      return "[:space:]"
    end
  end

  def check_input(delimeter, num_string)
    regex = Regexp.new("[[-]*[[:digit:]]+[,]*[#{delimeter}]*]+")

    #check for trialing spaces and new lines then a pattern match
    if !num_string[num_string.size-1].match(/\d/) || !(num_string[num_string.length-1] =~ /[[:space:]]/).nil?
      return false
    elsif num_string == regex.match(num_string).to_s
      return true
    else
      return false
    end
  end
end
