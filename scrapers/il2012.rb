require './il2013'



class InternetLibrarian2012Scraper < InternetLibrarian2013Scraper
  def initialize
    super
  end

  def init_scraper_conference()
    return Conference.new("Internet Librarian","2012")
  end
end  
  
# scraper = InternetLibrarian2013Scraper.new
# source_directory = "source_files/il2012/"
# conference = scraper.scrape_conference(["#{source_directory}il2012-sunday.html","#{source_directory}il2012-monday.html","#{source_directory}il2012-tuesday.html","#{source_directory}il2012-wednesday.html"])
# puts conference.to_xml