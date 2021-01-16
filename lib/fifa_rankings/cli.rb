class FifaRankings::CLI
    def call
      FifaRankings::Scraper.new.get_rankings
        binding.pry
      start
    end
  


    
    def start
      puts "Welcome to the Fifa Men's Ranking Site!"
  
      puts "Which Fifa rankings would you like displayed? 1-10, 11-20, 21-30, 31-40 or 41-50?"
      input = gets.strip.to_i
  
      print_countries(input)
  
      puts ""
      puts "Please input the number of country whose ranking history you'd like to see."
      input = gets.strip
  
      country = FifaRankings::Country.find(input.to_i)
  
      print_country(country)
  
      puts ""
      puts "Would you like to see another country? Enter Y or N"
  
      input = gets.strip.downcase
      if input == "y"
        start
      elsif input == "n"
        puts ""
        puts "Cheers Mate! Have a great day!"
        exit
      else
        puts ""
        puts "I don't understand that answer."
        start
      end
    end
   
   def print_country(country)
      puts ""
      puts "-- #{country.country} - #{country.ranking} --"
      puts ""
      puts ""
  
  puts "#{country.rec_text} #{country.rec_num} "
  puts "#{country.ave_text} #{country.ave_num} "
  

    end
  
    def print_countries(from_number)
      puts ""
      puts "---------- countries #{from_number} - #{from_number + 9} ----------"
      puts ""
         
      puts "Rank Country               Points  Abbr Conference"
  FifaRankings::Country.all[from_number-1, 10].each do |i|
      puts "#{i.ranking.ljust(4)} #{i.country.ljust(20)}  #{i.points.ljust(6)}  #{i.abbreviation.ljust(4)} #{i.conference} "
      end
   
    end
     
  end
  
