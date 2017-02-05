class TouristGuide::Cli

  def call
    puts "                                                                   ✰✰✰✰✰".light_red
    puts "                                                ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰".light_red
    puts "                                        ✰✰✰✰✰     WELCOME TO THE TOURIST'S ERBIL GUIDE     ✰✰✰✰✰".colorize(:color => :light_yellow).bold
    puts "                                                                version#{TouristGuide::VERSION}".colorize(:color => :yellow)
    puts "                                                      ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰".light_yellow
    puts "                                                             ✰✰✰✰✰     ✰✰✰✰✰".green
    puts "                                                                   ✰✰✰✰✰".green
    list
    user_insert
  end

  def list
    puts ""
    puts "CHOOSE YOUR CATEGORY:".colorize(:color => :blue).bold
    # puts "----------------------------------------------------------------------------------------------------------------------------------------------------".colorize(:background => :light_blue)
    puts "                                                                                                                                                    ".colorize(:background => :blue)
    puts ""
    puts "               1. Hotels   ♡ ♡ ♡ ♡ ♡   2. Restaurants   ♡ ♡ ♡ ♡ ♡   3. Cafeterias   ♡ ♡ ♡ ♡ ♡   4. Parks   ♡ ♡ ♡ ♡ ♡   5. Malls".light_green
    puts ""
    puts "                                  ♡ ♡ ♡ ♡ ♡   6. Back to the main menu    ♡ ♡ ♡ ♡ ♡   7. Exit    ♡ ♡ ♡ ♡ ♡   ".green
  end

  def user_insert
    input = nil
    input = gets.strip
    directions(input)
  end

#first_way
    def directions(num)
      if num == "1"
        puts "ERBIL'S HOTELS LIST:"
        puts ""
        run("Hotels")
        list
        user_insert
      elsif num == "2"
        puts "ERBIL'S RESTAURANTS LIST:"
        puts ""
        run("Restaurants")
        list
        user_insert
      elsif num == "3"
        puts "ERBIL'S CAFETERIES LIST:"
        puts ""
        run("coffee%20shops")
        list
        user_insert
      elsif num == "4"
        puts "ERBIL'S PARKS LIST:"
        puts ""
        run("Parks")
        list
        user_insert
      elsif num == "5"
        puts "ERBIL'S MALLS LIST:"
        puts ""
        run("Malls")
        list
        user_insert
      elsif   num == "6"
        call
      elsif num == "7"
        puts "                                                          THANK YOU! HAVE A NICE TIME!".magenta
      else
        puts ""
        puts ""
        puts "NOT valid, please insert valid input"
        puts ""

        list
          user_insert
      end
  end

#second_way
  # def directions(num)
  #   case num
  #   when "1"
  #     puts "ERBIL'S HOTELS LIST:"
  #     puts ""
  #     run("Hotels")
  #     list
  #     user_insert
  #   when "2"
  #     puts "ERBIL'S RESTAURANTS LIST:"
  #     puts ""
  #     run("Restaurants")
  #     list
  #     user_insert
  #   when "3"
  #     puts "ERBIL'S CAFETERIES LIST:"
  #     puts ""
  #     run("coffee%20shops")
  #     list
  #     user_insert
  #   when "4"
  #     puts "ERBIL'S PARKS LIST:"
  #     puts ""
  #     run("Parks")
  #     list
  #     user_insert
  #   when "5"
  #     puts "ERBIL'S MALLS LIST:"
  #     puts ""
  #     run("Malls")
  #     list
  #     user_insert
  #   when "6"
  #     call
  #   when "7"
  #     puts "THANK YOU! HAVE A NICE TIME!"
  #   else
  #     puts ""
  #     puts ""
  #     puts "NOT valid, please insert valid input"
  #     puts ""
  #     list
  #     user_insert
  #   end
  # end



  def run(direction)
    create_directions(direction)
    display_directions
    TouristGuide::Tour.clear
  end

  def create_directions(name)
    scraping = TouristGuide::Scraping.new
    dir_attr = scraping.page_scraping(name)
    TouristGuide::Tour.create_from_collection(dir_attr)
  end

  def display_directions
    TouristGuide::Tour.all.each do |direction|
      #first_way
      # name= direction.name.ljust(38, ' ')
      # address= direction.address.ljust(21, ' ')
      # description= direction.description.ljust(0, ' ')
      # puts "Name: #{name} Address: #{address} Description: #{description}"
      #second_way
      puts "Name: #{direction.name.ljust(38, ' ').blue}     Address: #{direction.address.ljust(21, ' ').blue}     Description: #{direction.description.ljust(0, ' ').blue}"
      puts "_________________________________________________________________________________________________________________________".magenta
    end
  end

end
