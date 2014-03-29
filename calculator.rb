class Calculator
  def add(num_string)
    numbers = num_string.split(",").map(&:to_i)
    total = numbers.inject{|sum, x| sum += x}
    puts "#{numbers.join(' + ')} =  #{total}"
  end
end
