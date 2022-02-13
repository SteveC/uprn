class AddCentroidGeoIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :centroids, :lonlat, using: :gist
  end
end
