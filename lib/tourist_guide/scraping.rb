class TouristGuide::Scraping

  def page_scraping(direction_name)
    scraped_directions =[]
    direction_name = direction_name.downcase
    # direction_name= ["malls", "park", "restaurants", "hotels", "coffee%20shops"]
    html = open("https://iq.brate.com/en/search?q=#{direction_name}&region=8&sort=2&page=1")

    scraped_page = Nokogiri::HTML(html)

    array = scraped_page.css("div.single-search-result")
    array.each do |category|
        place = {}
        name = category.css(".search-result-title h3").text.strip
        address = category.css(".source a.b-link").text.strip
        description = category.css(".search-result-title div.search-result-business-category").text.strip

        place[:name] = name
        place[:address] = address
        place[:description] = description

        scraped_directions << place
  end
    return scraped_directions
  end

end


# https://iq.brate.com/en/search?q=malls&region=8&sort=2&page=1               #malls
# https://iq.brate.com/en/search?q=park&region=8&sort=2&page=1                 #parks
# https://iq.brate.com/en/search?q=restaurants&region=8&sort=2&page=1          #restaurants
# https://iq.brate.com/en/search?q=hotels&region=8&sort=2&page=1               #hotels
# https://iq.brate.com/en/search?q=coffee%20shops&region=8&sort=2&page=1      #coffee shops
