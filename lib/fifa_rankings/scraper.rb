
class FifaRankings::Scraper 


  def get_page
     Nokogiri::HTML(open("https://www.fifa.com/fifa-world-ranking/ranking-table/men/#all"))
  end
  
  def get_rankings
     fifa_teams = self.get_page.css('tr')
    
 fifa_teams.each_with_index do |team, x|
        next if x == 0
  
  FifaRankings::Country.create(team)        
    end
 
  end
  

  
 end