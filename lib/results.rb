require 'optparse'
require 'csv'
require './lib/sensor_repo'

class Results
  attr_reader :files

  def initialize(directory)
    home = Dir.home
    @directory = directory
    @files = Dir.glob("#{home}/#{@directory}/*.csv")
    read_csvs
  end

  def read_csvs
    if files.empty?
      puts "No CSVs in #{@directory}"
    else
      files.each_with_index do |file, index|
        opened = CSV.read(file, headers: true, header_converters: :symbol)
        SensorRepo.new(opened).summary(files[index])
      end
    end
  end

end


options = {}

OptionParser.new do |parser|
  parser.on("-d", "--dir DIR", "The name of the directory.") do |v|
    options[:dir] = v
  end
end.parse!

Results.new(options[:dir])

