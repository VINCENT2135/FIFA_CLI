class FifaRankings::Country
    attr_accessor :ranking, :country, :abbreviation, :points, :conference,  :url, :average_num, :average_text, :recent_num, :recent_text
   
    @@all = []
  
    def self.create(team)
      self.new(
      team.css('td.fi-table__td.fi-table__rank').text,                 
           team.css('span.fi-t__nText').text,                               # c
           team.css('span.fi-t__nTri').text,                                # ab
           team.css('td.fi-table__td.fi-table__points span.text').text,     
           team.css('td.fi-table__td.fi-table__confederation.hidden').text, 
           team.css('a')[0]['href']                                        
        )
    end
  
    def self.all
      @@all
    end
   
    def self.find(id)
      self.all[id - 1]
    end
   
   
    def initialize(ranking=nil, country=nil, abbreviation=nil, points=nil, conference=nil, url=nil)
      @ranking = ranking
      @country = country
      @abbreviation = abbreviation
      @points = points
      @conference = conference
      @url = "https://www.fifa.com" + url
      @@all << self
    end
   
        
def self.above_1500

      above_1500 = []
      
        @@all.each do |country |
          if country.points.to_i > 1500
      
              above_1500 << country
            end
          end
        above_1500
      end

def self.uefa_teams
  #This method will return an array of Country objects that are part of the UEFA conference

    uefa_teams = []
      
        @@all.each do |conference|
          if conference.conference ==  "#UEFA#"
  
            uefa_teams << conference
      
        end
      end
    uefa_teams
  end
    
    def self.doc
      @doc = Nokogiri::HTML(open(self.url))
    end
  
    def rec_text
      @recent_text = doc.css('div.fi-ranking-bignumber').css('span.fi-ranking-bignumber--description')[0].text.strip
    end
  
    def rec_num
      @recent_num = doc.css('div.fi-ranking-bignumber').css('span.fi-ranking-bignumber--data')[0].text.strip
    end
   
    def ave_text
      @average_text = doc.css('div.fi-ranking-bignumber').css('span.fi-ranking-bignumber--description')[1].text.strip
    end
    def ave_num
      @average_num = doc.css('div.fi-ranking-bignumber').css('span.fi-ranking-bignumber--data')[1].text.strip
    end
  
  
    def doc
      @doc = Nokogiri::HTML(open(self.url))
    end
     
  end
