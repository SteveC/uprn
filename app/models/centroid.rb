class Centroid < ApplicationRecord
    
    attribute :centroid, :st_point, srid: 4326, geographic: true
end
