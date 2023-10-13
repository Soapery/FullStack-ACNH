require "csv"

# Clearing existing records for re-seeding
Player.delete_all
PlayerHome.delete_all
HomeFurniture.delete_all
Furniture.delete_all

# Resetting PK on tables
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='players';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='player_homes';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='home_furnitures';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='furnitures';")

# Retrieving CSV Data
filename = Rails.root.join("db/housewares.csv")
puts "Loading Furniture from the CSV file: #{filename}"
csv_data = File.read(filename)
furnitures = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# Populating Furniture table
furnitures.each do |row|
  # Replaces "NA" values with equivalent values
  furniture = Furniture.create(
    name:      row["name"],
    variation: row["variation"] == "NA" ? nil : row["variation"],
    pattern:   row["pattern"] == "NA" ? nil : row["pattern"],
    price:     row["price"] == "NA" ? 0 : row["price"].to_i,
    diy:       row["DIY"] == "Yes"
  )
end

# Populating Player, PlayerHome, and HomeFurniture tables
25.times do
  # Creating Player
  player = Player.new(
    username: Faker::Internet.username(specifier: 3..10),
    gender:   Faker::Gender.type,
    email:    Faker::Internet.email,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 60),
    bells:    Faker::Number.between(from: 1, to: 100_000)
  )

  player_home = player.build_player_home(
    size:       ["Small", "Medium", "Large"].sample,
    home_value: 0
  )

  player.save

  # Populating PlayerHome with furniture
  10.times do
    home_furniture = HomeFurniture.create(
      player_home_id: player_home.id,
      furniture_id:   Furniture.pluck(:id).sample,
      amount:         rand(1..10)
    )
  end

  # Calculate the home_value based on associated furniture prices
  home_value = player_home.home_furnitures.sum { |home_furniture| home_furniture.furniture.price }
  player_home.update(home_value:)
end
