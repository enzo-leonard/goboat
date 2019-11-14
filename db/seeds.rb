# réiinitialisation de la db
puts "On va écraserla DB les frères"
Booking.destroy_all
Boat.destroy_all
User.destroy_all





# SEED USER :
puts "Creation de personnage super cool !"

portrait = ["https://images.unsplash.com/photo-1546538994-4f15d0aa966f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=60",
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60",
            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60",
            "https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60",
            "https://images.unsplash.com/photo-1504257432389-52343af06ae3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"]

i = 0
5.times do
  username = Faker::Games::Pokemon.name
  User.create!(
    username: username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    description: "hi my name is #{username} one day i met yoda and he says to me '#{Faker::Quote.yoda}' but Chuck explain him that #{Faker::ChuckNorris.fact}",
    photo: portrait[i])
    i += 1
end

admin = User.new(
    email: 'admin@gmail.com',
    password: 'password',
    username: 'admin',
    last_name: 'admin',
    first_name: 'admin',
    photo: 'https://images.unsplash.com/photo-1546538994-4f15d0aa966f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=60',
    description: "describe your self lazy admin..."
)
admin.save!
puts "Chuck Norris Win !"


#SEED BOAT :
# require 'uri'

index_url1 = "https://www.clickandboat.com/location-bateau/france/marseille"
index_url2 = "https://www.clickandboat.com/location-bateau/france/brest"


def fetch_boat(url)
  html_file = open(URI::encode(url)).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('h2').each do |element|
    @args_boats[:name] = element.text.strip
  end
  html_doc.search('#general > div.key-info > span.icon-user-single-a-group.col-3-12.mobile-col-6-12').each do |element|
    @args_boats[:capacity] = element.text.strip
  end
  html_doc.search('p').each do |element|
    ap "je usi sla"
    ap element.text
    @args_boats[:description] = element.text
    break
  end
   html_doc.search('.picSlide').each_with_index do |element, index|
   if index == 0
    a = element.attribute('style').value.gsub('background-image: url(//', '').gsub(');', '')
    @args_boats[:photo] = a
  end
  end

  html_doc.search('#map').each do |elem|
    @args_boats[:lat] = elem.attribute('data-img-src').value.match(/([=]\d{1,}.\d{1,})/).to_s.gsub('=', '')
  end
   html_doc.search('#map').each do |elem|
   @args_boats[:long] = elem.attribute('data-img-src').value.match(/([C]\d{1,}\W\d{1,})/).to_s.gsub('C', '')
   end




   booty = Boat.new(@args_boats)
   random_user = User.all.sample
   booty.user = random_user
   booty.save!

end

def fetch_index(url)
  @args_boats = {}
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('span.price').each do |elem|
    @args_boats[:price] = elem.text.strip
  end
  html_doc.search('span.textReg').each do |elem|
    @args_boats[:city] = elem.text.strip
  end
  html_doc.search('.product-link').each_with_index do |element, i|
    fetch_boat(element.attribute('href').value)
  end
end

fetch_index(index_url1)
#fetch_index(index_url2)


puts "Creation de l'admin et ses reservations "



admin_booking1 = Booking.new(
  date_begin: "12/09/2019",
  date_end: "12/10/2019",
)

admin_booking2 = Booking.new(
  date_begin: "13/09/2019",
  date_end: "13/10/2019",
)

admin_boat1 = Boat.last
admin_boat1.update!(available: false, date_end: admin_booking1.date_end)
admin_boat2 = Boat.first
admin_boat2.update!(available: false, date_end: admin_booking2.date_end)

admin_booking1.boat = admin_boat1
admin_booking1.user = admin
admin_booking1.save!
admin_booking2.boat = admin_boat2
admin_booking2.user = admin
admin_booking2.save!










puts "La puissance du port du Havre"


