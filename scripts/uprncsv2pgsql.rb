#!/usr/bin/ruby

# create table uprns (uprn bigint unique not null, g geography(POINT, 4326));

line = gets # disregard the header
while line=gets do
  arr = line.chomp.split ','
  uprn = arr[0]
  lat = arr[3]
  lng = arr[4]

  sql = "insert into centroids (id,centroid) values (#{uprn}, st_geomfromtext('point(#{lng} #{lat})'));"

  puts sql
end
