class AddInitialUprnData < ActiveRecord::Migration[7.0]
  # import gem will be thwarted by migration transactions unless we turn them off
  disable_ddl_transaction!

  # imports all the data segments, see data/split_os_csv.sh
  def up
    puts "Importing CSV data from segments..."

    Dir.glob('data/segment*') do |filename|
      puts "importing " + filename
      infile = File.open(filename)
      gz = Zlib::GzipReader.new(infile)

      centroids = []
      gz.each_line() do |line| 
        array = line.chomp.split ','
        id = array[0].to_i
        lon = array[4]
        lat = array[3]

        c = Centroid.new
        c.id = id
        c.lonlat = "point(#{lon} #{lat})"
        centroids << c
      end

      Centroid.import(centroids)
    end
  end

  def down
    Centroid.delete_all
  end
end