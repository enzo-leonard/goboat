# réiinitialisation de la db
puts "On va écraserla DB les frères"
Booking.destroy_all
Review.destroy_all
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
    username: 'Samantha',
    last_name: 'Samantha',
    first_name: 'Samantha',
    photo: 'https://images.unsplash.com/photo-1546538994-4f15d0aa966f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=60',
    description: "describe your self lazy admin..."
)
admin.save!
puts "Chuck Norris Win !"


#SEED BOAT :
# require 'uri'

index_url1 = "https://www.clickandboat.com/location-bateau/france/marseille"
index_url2 = "https://www.clickandboat.com/location-bateau/france/brest"
index_url3 = "https://www.clickandboat.com/location-bateau/france/lyon"
index_url4 = "https://www.clickandboat.com/location-bateau/france/paris"
index_url5 = "https://www.clickandboat.com/location-bateau/france/toulon"
index_url6 = "https://www.clickandboat.com/location-bateau/france/strasbourg"
index_url7 = "https://www.clickandboat.com/location-bateau/france/bastia"
index_url8 = "https://www.clickandboat.com/location-bateau/france/biarritz"
index_url9 = "https://www.clickandboat.com/location-bateau/france/bordeaux"
index_url10 = "https://www.clickandboat.com/location-bateau/france/ajaccio"


def fetch_boat(url)
  html_file = open(URI::encode(url)).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('h2').each do |element|
    @args_boats[:name] = element.text.strip
  end
  html_doc.search('#general > div.key-info > span.icon-user-single-a-group.col-3-12.mobile-col-6-12').each do |element|
    @args_boats[:capacity] = element.text.strip
  end
  html_doc.search('#product-view').each do |elem|
   @args_boats[:price] = elem.attribute('data-from-price').value
   end
  html_doc.search('p').each do |element|
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


   if @args_boats[:capacity].to_i <= 6
    @args_boats[:category] = "Petit Calibre"
  elsif @args_boats[:capacity].to_i <= 9
    @args_boats[:category] = "Moyen Calibre"
  else @args_boats[:category] = "Gros Calibre"
  end


   booty = Boat.new(@args_boats)
   random_user = User.all.sample



   booty.user = random_user
   booty.save!

   html_doc.search('.content').each_with_index do |element|
    if element.text.strip != ''
      review = Review.new(input: element.text.strip)
      review.boat = booty
      review.user = User.all.sample
      review.save!
      p "---------------------\nCommentaire :"+element.text.strip
    end
  end

end

def fetch_index(url)
  @args_boats = {}
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('span.textReg').each do |elem|
     @args_boats[:city] = elem.text.strip
      end

  html_doc.search('.product-link').each_with_index do |element, i|
    if element.attribute('href').present?
      fetch_boat(element.attribute('href').value)
    else
      link = element.attribute('data-chaos').value
      fetch_boat(Base64.decode64(link.gsub("∞", "")))
  end
end
end

fetch_index(index_url1)
fetch_index(index_url2)
fetch_index(index_url3)
fetch_index(index_url4)
fetch_index(index_url5)
fetch_index(index_url6)
fetch_index(index_url7)
fetch_index(index_url8)
fetch_index(index_url9)
fetch_index(index_url10)



puts "Creation de l'admin et ses reservations "



admin_booking1 = Booking.new(
  date_begin: "12/09/2019",
  date_end: "12/10/2019",
  price: 580
)

admin_booking2 = Booking.new(
  date_begin: "13/09/2019",
  date_end: "13/10/2019",
  price: 560
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







