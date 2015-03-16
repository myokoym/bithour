module Bytehour
  class Day
    def initialize
      @day = 0
    end

    def add(first_hour, last_hour)
      hours = "%024d" % @day.to_s(2)
      hours.reverse!
      first_hour.upto(last_hour) do |i|
        hours[i] = "1"
      end
      @day = hours.reverse.to_i(2)
    end

    def include?(hour)
      @day[hour] == 1
    end
  end
end
