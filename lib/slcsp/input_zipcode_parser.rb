require 'CSV'

class SLCSP
  class InputZipcodeParser
    def self.call(path = './data/slcsp.csv')
      file = CSV.read(path, headers: true)
      file.map { |row| row['zipcode'] }
    end
  end
end
