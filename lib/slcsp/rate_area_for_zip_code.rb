require 'CSV'

class SLCSP
  class RateAreaForZipcode
    AMBIGUOUS_RATE_AREA = 'ambiguous'

    def initialize(path = './data/zips.csv')
      @path = path
      @rate_area_for_zip = {}

      populate
    end

    def call(zipcode)
      rate_area = @rate_area_for_zip[zipcode]

      return rate_area unless rate_area == AMBIGUOUS_RATE_AREA
    end

    private

    def populate
      CSV.foreach(@path, headers: true) do |row|
        zip       = row['zipcode']
        state     = row['state']
        rate_area = row['rate_area']
        tuple     = [state, rate_area]

        add_rate_area(zip, tuple)
      end
    end

    def add_rate_area(zip, tuple)
      @rate_area_for_zip[zip] = if @rate_area_for_zip.key?(zip) && @rate_area_for_zip[zip] != tuple
                                  AMBIGUOUS_RATE_AREA
                                else
                                  tuple
                                end
    end
  end
end
