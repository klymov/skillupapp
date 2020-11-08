# search_all_orders_with_status_1_and_id>10
# @orders_with_status_1 = Order.select(:id, :description).where('id > 10', status: "1")
# @orders_with_status_1.each do |t|
#   puts "Order: #{t.id}, #{t.description}"
# end
# binding.pry

## clear drivers avatar
# removing_avatars_from_drivers
# User.where(role: "1").update_all(avatar: nil)


## select_user_city_country
  # User.select('users.username, cities.city, cities.country').joins(city: :country)


## notesting add "+38" for Ukrainians
  # ukrainian_numbers = User.select('users.phone, country.country').joins(:city).where(country: 'Ukraine')
  # ukrainian_numbers.each do |i|
  #   if i.last == 'Ukraine'
  #     "+38 #{i.first}"
  #   else
  #     "#{i.first}"
  #   end

# country.cities.create(city: 'association city')

# Add countries and cities to db
# Country.delete_all
# @all_countries = Array.new
# countries_map = {"Ukraine"=> {code: "UA", cities: ["Kiiv", "Kharkiv", "Chernivtsi"]}, "Austria" => {code: "AU", cities: ["Viena", "Zalzburg"]}}
# countries_map.each{ |country_name, country_data|
#   @country = Country.create([country: country_name, code: country_data.first[1], created_at: Time.now.utc.iso8601, updated_at: Time.now.utc.iso8601])
#   @country.each{ |country|
#     country_data[:cities].each{ |city_name|
#       City.insert_all([city: city_name, country_id: country.id, created_at: Time.now.utc.iso8601, updated_at: Time.now.utc.iso8601])
#     }
#   }
# }


# Try to do custom sql from rails c


# add countries in db
# require 'open-uri'
# Country.delete_all
# open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
# open("db/seeds/allCountriesTXT.txt") do |countries|
#   countries.read.each_line do |country|
#     code, country = country.chomp.split("|")
#     Country.create!(:country => country, :code => code)
#   end
# end

# company = Company.find_by_name('Hatch')
#   company.users.create(:first_name => 'James', :last_name => 'McCarthy')
#COUNTRY,POSTAL_CODE,CITY,STATE,SHORT_STATE,COUNTY,SHORT_COUNTY,COMMUNITY,SHORT_COMMUNITY,LATITUDE,LONGITUDE,ACCURACY
#allCountriesTXT.txt
