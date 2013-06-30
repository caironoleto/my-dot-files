#!/Users/caironoleto/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

class PisPasepGenerator
  INDEX = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

  def self.generate!
    numbers = []
    10.times { numbers << rand(10) }

    calculated = numbers.each_with_index { |n, i| PisPasepGenerator::INDEX[i] * n }.inject(:+)

    rest = calculated % 11
    calculated = 11 - rest

    if calculated == 10 || calculated == 11
      numbers << 0
    else
      numbers << calculated
    end

    numbers.join
  end
end

puts PisPasepGenerator.generate!
