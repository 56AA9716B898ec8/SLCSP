require 'CSV'

class SLCSP
  class SlcspForRateArea
    def initialize(path = './data/plans.csv')
      @path = path
      @rates = Hash.new { |h, k| h[k] = [] }

      populate
    end

    def call(rate_area)
      slcsp(rate_area)
    end

    private

    def populate
      CSV.foreach(@path, headers: true) do |row|
        if row['metal_level'].downcase == 'silver'
          state     = row['state']
          rate_area = row['rate_area']
          rate      = row['rate']
          tuple     = [state, rate_area]

          add_rate(rate, tuple)
        end
      end
    end

    def add_rate(rate, tuple)
      @rates[tuple] << rate
      @rates[tuple] = @rates[tuple].uniq.sort.first(2)
    end

    def slcsp(rate_area)
      rate = @rates[rate_area]

      return nil if rate.length <= 1

      format('%.2f', rate.last)
    end
  end
end
