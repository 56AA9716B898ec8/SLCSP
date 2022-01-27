require_relative 'slcsp/input_zipcode_parser'
require_relative 'slcsp/rate_area_for_zip_code'
require_relative 'slcsp/slcsp_for_rate_area'

class SLCSP
  def initialize
    @input_zipcodes = InputZipcodeParser.call
    @rate_area_for_zipcode = RateAreaForZipcode.new
    @slcsp_for_rate_area = SlcspForRateArea.new
  end

  def solve
    puts 'zipcode,rate'

    @input_zipcodes.each do |zipcode|
      answer = slcsp(zipcode)
      puts "#{zipcode},#{answer}"
    end
  end

  def slcsp(zipcode)
    rate_area = @rate_area_for_zipcode.call(zipcode)
    @slcsp_for_rate_area.call(rate_area)
  end
end
