# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'mechanize'
# require 'pry'
# require 'byebug'

10.times do
    User.create(username: Faker::TvShows::BreakingBad.character, avatar: Faker::Avatar.image)
end


30.times do
    FieldEntry.create(user: User.all.sample, notes: Faker::Lorem.paragraph, date: Faker::Date.between(from: 14.days.ago, to: Date.today), latitude: (47 + rand) ,longitude: (-122 - rand))
end

25.times do
    image = Image.create(img_url: Faker::LoremFlickr.image, description: Faker::Lorem.sentence)
    FieldEntry.all.sample.images << image
end

mechanize = Mechanize.new

page = mechanize.get("https://birdsna.org/Species-Account/bna/species")

birdLinks = page.links_with(dom_class: "notranslate")

##note to self - instead of scraping everything, I could only scrape names and urls
##in that scenario I would need to perform a second scrape to get the bird data on a click

if Bird.all.length == 0 
    birdLinks.each do |link|
        birdPage = link.click
        common_name = birdPage.search("h1.notranslate").text
        species_name = birdPage.search("h4.notranslate").text
        img_url = birdPage.image.src
        # region = birdPage.search("img.RangeMap-image")[0].attributes["src"].value
        region = birdPage.images[1].src
        if !!birdPage.link_with(dom_class: "Button Button--large Button--listen")
            birdcall = birdPage.link_with(dom_class: "Button Button--large Button--listen").href
        end
        characteristics = birdPage.search("#overview p").text.split("\n").join("").split("\t").join("")
        ##rename region to range map, rename characteristics to bird information

        Bird.create(common_name: common_name, species_name: species_name, img_url: img_url, region: region, birdcall: birdcall, characteristics: characteristics)
    end
end