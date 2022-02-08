class CreateCentroids < ActiveRecord::Migration[7.0]
  def change
    create_table :centroids do |t|

      t.timestamps
    end
  end
end
