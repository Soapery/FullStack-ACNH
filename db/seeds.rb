require "csv"

# Clearing existing records for re-seeding
HomeFurniture.delete_all
PlayerHome.delete_all
Furniture.delete_all
Player.delete_all

# Resetting PK on tables
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='furnitures';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='players';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='player_homes';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='home_furnitures';")

# Retrieving CSV Data
filename = Rails.root.join("db/housewares.csv")
puts "Loading Furniture from the CSV file: #{filename}"

# Populating Furniture table
# Encoding in UTF-8 while removing BOM
CSV.foreach(filename, 'r:BOM|UTF-8', headers: true) do |row|
  # Replaces "NA" values with equivalent values
  furniture = Furniture.create(
    name:      row["Name"],
    variation: row["Variation"] == "NA" ? nil : row["Variation"],
    pattern:   row["Pattern"] == "NA" ? nil : row["Pattern"],
    price:     row["Sell"] == "NA" ? 0 : row["Sell"].to_i,
    diy:       row["DIY"] == "Yes"
  )
  puts furniture.inspect
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
