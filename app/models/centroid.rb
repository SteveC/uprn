class Centroid < ApplicationRecord    
    attribute :centroid, :st_point, srid: 4326, geographic: true

    def self.within_box(sw_lat, sw_lon, ne_lat, ne_lon, limit)
        factory = RGeo::Geographic.spherical_factory
        sw = factory.point(sw_lon, sw_lat)
        ne = factory.point(ne_lon, ne_lat)
        window = RGeo::Cartesian::BoundingBox.create_from_points(sw, ne).to_geometry
        where("lonlat && ?", window).limit(limit)
    end
end
