class TouristGuide::Cli

  def call
    puts "                                                         ✰✰✰✰✰"
    puts "                                      ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰"
    puts "                              ✰✰✰✰✰     WELCOME TO THE TOURIST'S ERBIL GUIDE     ✰✰✰✰✰"
    puts "                                      ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰"
    puts "                                            ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰"
    puts "                                                   ✰✰✰✰✰     ✰✰✰✰✰"
    # puts "                                                         ✰✰✰✰✰"
      puts ""
      puts "choose your destination:"
      puts "----------------------------------------------------------------------------------------------------------------------"
      puts "1. Hotels   ♡ ♡ ♡ ♡ ♡   2. Restaurants   ♡ ♡ ♡ ♡ ♡   3. Cafeterias   ♡ ♡ ♡ ♡ ♡   4. Parks   ♡ ♡ ♡ ♡ ♡   5. Malls"
      puts ""
      puts "                   ♡ ♡ ♡ ♡ ♡   6. Back to the main menu    ♡ ♡ ♡ ♡ ♡   7. Exit    ♡ ♡ ♡ ♡ ♡   "

      user_insert
  end

  def user_insert
    input = nil
    input = gets.strip
    directions(input)
  end

  def directions(num)
    if num == "1"
      puts "ERBIL'S HOTELS LIST:"
      puts ""
      run("Hotels")
      user_insert
    elsif num == "2"
      puts "ERBIL'S RESTAURANTS LIST:"
      puts ""
      run("Restaurants")
      user_insert
    elsif num == "3"
      puts "ERBIL'S CAFETERIES LIST:"
      puts ""
      run("coffee%20shops")
      user_insert
    elsif num == "4"
      puts "ERBIL'S PARKS LIST:"
      puts ""
      run("Parks")
      user_insert
    elsif num == "5"
      puts "ERBIL'S MALLS LIST:"
      puts ""
      run("Malls")
      user_insert
    elsif   num == "6"
      call
    elsif num.to_i > 7 && num.to_i < 0
      puts "please, insert valid input"
        user_insert
    elsif num == "7"
      puts "THANK YOU! HAVE A NICE TIME!"
    else
      puts "NOT valid, please insert 1-7 according to your need"
    end
end

# def directions(num)
  # input = nil
  # while input !="exit"
  #   puts "type list or exit"
    # input = gets.strip.downcase
#     input = input.to_i > 0 ? input.to_i : input
#
#     case user_insert
#     when "1"
#       puts "ERBIL'S HOTELS LIST:"
#       puts ""
#       run("Hotels")
#       user_insert
#     when "2"
#       puts "ERBIL'S RESTAURANTS LIST:"
#       puts ""
#       run("Restaurants")
#       user_insert
#     when "3"
#       puts "ERBIL'S CAFETERIES LIST:"
#       puts ""
#       run("Cafeterias")
#       user_insert
#     when "4"
#       puts "ERBIL'S PARKS LIST:"
#       puts ""
#       run("Parks")
#       user_insert
#     when "5"
#       puts "ERBIL'S MALLS LIST:"
#       puts ""
#       run("Malls")
#       user_insert
#     when "6"
#       call
#     when "7"
#       puts "THANK YOU! HAVE A NICE TIME!"
#     when Fixnum
#       item= @operation_system[input.to_i-1]
#       puts "#{item.name} - #{item.url}"
#       puts "choose category"
#     else
#       puts "NOT valid, please insert 1-7 according to your need"
#       directions # recursion
#     end
#   end
# end



  def run(direction)
    create_directions(direction)
    display_directions
  end

  def create_directions(name)
    scraping = TouristGuide::Scraping.new
    dir_attr = scraping.page_scraping(name)
    TouristGuide::Tour.create_from_collection(dir_attr)
  end

  def display_directions
    TouristGuide::Tour.all.each do |direction|
      puts "Name: #{direction.name}.     Address: #{direction.address}.     Description: #{direction.description}"
      end
  end

end
