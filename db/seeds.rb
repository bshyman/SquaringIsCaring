# 5.times{ User.create!( email: FFaker::Internet.email, password: 'password', first_name: FFaker::Name.first_name,last_name: FFaker::Name.last_name, avatar: FFaker::Avatar.image, birthday: FFaker::Time.date, street_address: FFaker::AddressUS.street_address, apt_num: FFaker::AddressUS.secondary_address, city: FFaker::AddressUS.city, state: FFaker::AddressUS.state, zip: FFaker::AddressUS.zip_code, phone_num: FFaker::PhoneNumber.phone_number )} 
 

# 7.times { Contest.create!( home_team: FFaker::AddressUS.city, away_team: FFaker::AddressUS.city, event_date: DateTime.now + rand(150), cell_value: rand(1..5), sport: FFaker::Sport.name, prizes: [FFaker::BaconIpsum.word, FFaker::BaconIpsum.word] )}

results = [[], [1], [1,2], [2]]

# 100.times{ Cell.create!( contest_id: rand(1..7), user_id: rand(1..5), position: [rand(0..9), rand(0..9)], result: results.sample )}

# User.create!(email: "bshyman@gmail.com", password: "password", first_name: "Benjamin", last_name: "Shyman", avatar: FFaker::Avatar.image, birthday: FFaker::Time.date, street_address: "8611 W Lillian Ave", apt_num: "2", city: "Chicago", state: "IL", zip: "60614", phone_num: "8473448329", admin?: true)

# User.create!(email: "bfishbain@gmail.com", password: "password", first_name: "Brad", last_name: "Fishbain", avatar: FFaker::Avatar.image, birthday: FFaker::Time.date, street_address: "1012 Ya Motha", apt_num: "1", city: "Chicago", state: "IL", zip: "60614", phone_num: "8473448329", admin?: true)

Contest.create!(home_team: "New England Patriots", away_team: "Atlanta Falcons", event_date: DateTime.new(2017, 2, 5, 17, 30).utc, cell_value: 10, sport: "football", prizes: ["70%", "20%", "10%"], archived:true)

Contest.create!(home_team: "Bears", away_team: "Packers", event_date: DateTime.new(2017, 2, 9, 17, 30).utc, cell_value: 10, sport: "football", prizes: ["70%", "20%", "10%"],archived:true)

Contest.create!(home_team: "Patriots", away_team: "Falcons", event_date: DateTime.new(2017, 3, 30, 17, 30).utc, cell_value: 10, sport: "football", prizes: ["70%", "20%", "10%"])

Contest.create!(home_team: "Vikings", away_team: "Colts", event_date: DateTime.new(2017, 4, 9, 17, 30).utc, cell_value: 10, sport: "football", prizes: ["70%", "20%", "10%"])

Contest.create!(home_team: "Cubs", away_team: "Sox", event_date: DateTime.new(2017, 12, 5, 17, 30).utc, cell_value: 10, sport: "football", prizes: ["70%", "20%", "10%"])

Contest.create!(home_team: "Lakers", away_team: "Celtics", event_date: DateTime.new(2017, 6, 5, 17, 30).utc, cell_value: 10, sport: "football", prizes: ["70%", "20%", "10%"])
