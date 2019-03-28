# BrutEnforcer
class Brute
  # If you pass false for it;
  # you have to generate an alphabet with generate_alpha method
  def initialize(with_menu = true)
    @alpha = []
    menu if with_menu
  end

  def generate_alpha(length, upper, lower, digit)
    @alpha += Array('A'..'Z') if upper
    @alpha += Array('a'..'z') if lower
    @alpha += Array(0..9) if digit
    @array = Array.new(length, 0)
  end

  def next_letter
    return false if @alpha.size.zero?

    index = -1
    # Reset every end of array stuff, so it can roll back from 'A'
    while @array[index] == @alpha.size - 1
      @array[index] = 0
      index -= 1
    end
    # This will triggered if we reach end of the array
    return false if @array[index].nil?

    # Everything is fine. Just increase it
    @array[index] += 1
  end

  def brute(func)
    loop do
      return nil unless next_letter

      # Place an empty string for seeding the letters. Or, you can just print it.
      text = ''

      @array.each do |index|
        # Add each corresponding letter to the text, based on array's indexes.
        text << @alpha[index].to_s
      end
      # Write it. Change that for other uses.
      func.call(text)
    end
  end

  def take_answer
    gets.to_i == 1
  end

  def menu
    puts '(1 for yes, anything else for no.)'
    print 'Do you want UPPER letters?:'
    upper = take_answer
    print 'Do you want lower letters?:'
    lower = take_answer
    print 'Do you want digits?:'
    digit = take_answer
    print 'Last one, how long it should be?:'
    generate_alpha(gets.to_i, upper, lower, digit)
  end
end

def usage_example
  enforcer = Brute.new
  func = proc do |text|
    puts text
  end
  enforcer.brute(func)
end
usage_example
