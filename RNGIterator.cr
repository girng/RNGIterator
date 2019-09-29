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
    pp "#{average} iterations were needed   for a #{"%0.10f" % tests[0][1]}% chance to become true."
  end
end

RNGIterator.new(0.005, 5)
