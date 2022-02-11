class AddUprnCentroidsTable < ActiveRecord::Migration[7.0]
  # insert into centroids (id,centroid) values (#{uprn}, st_geomfromtext('point(#{lng} #{lat})'));"

  def change
    create_table :centroids do |t|
      t.st_point :lonlat, geographic: true
    end
  end
end
