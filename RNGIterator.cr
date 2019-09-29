require "colorize"

class RNGIterator
  property tests = Array(Array(Int32 | Float64)).new

  def initialize(chance = 0.01, times = 1)
    # chance default = 1%
    times.times do
      iterations = 0
      while test = rand(1.0)
        iterations += 1
        if test <= chance
          tests << [iterations, chance]
          break
        end
      end
    end

    display_averages
  end

  def display_averages
    average = tests.sum do |e|
      e[0]
    end / tests.size

    string = Array(String).new

    string << "#{"-----------------------------------------------------------------------------------------------------------------".colorize(:magenta)}"
    string << "Test Run                    Iterations Needed"
    string << "#{"-----------------------------------------------------------------------------------------------------------------".colorize(:magenta)}"
    tests.each_with_index do |muffin, i|
      string << "#{i + 1}. (#{muffin[1]}%)                  #{muffin[0]}".colorize(:green).to_s
    end

    puts string.join("\n")

    puts "#{"-----------------------------------------------------------------------------------------------------------------".colorize(:magenta)}"

    puts "Total: #{average} iterations were needed for a #{"%0.10f" % tests[0][1]}% chance to become true."
  end
end

RNGIterator.new(0.01, 5)
