require 'csv'

# Artists
params_array = []

CSV.foreach("db/artist.csv", {headers: true}) do |row|
  params_array << {
    alias: row[0],
    email: row[1],
    first_name: row[2],
    last_name: row[3],
    image_url: row[4],
    bio: row[5],
    website_url: row[6]
    }
end

params_array.each do |params|
  artist = Artist.new(params)
  artist.password = "123"
  artist.save!(params)
end

# Lovers
params_array = []

CSV.foreach("db/lover.csv", {headers: true}) do |row|
  params_array << {
    alias: row[0],
    email: row[1],
    first_name: row[2],
    last_name: row[3],
    image_url: row[4],
    bio: row[5],
    website_url: row[6]
    }
end

params_array.each do |params|
  artist = Lover.new(params)
  artist.password = "123"
  artist.save!(params)
end

# Artworks
params_array = []

CSV.foreach("db/artwork.csv", {headers: true}) do |row|
  params_array << {
    artist_id: row[0],
    title: row[1],
    description: row[2],
    image_url: row[3],
    date: row[4]
    }
end

params_array.each do |params|
  Artwork.create!(params)
end

# Categories
params_array = []

CSV.foreach("db/category.csv", {headers: true}) do |row|
  params_array << {
    name: row[0]
    }
end

params_array.each do |params|
  Category.create!(params)
end