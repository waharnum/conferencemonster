require './scraper_internet_librarian_2008_2013'

scraper = Scraper_Internet_Librarian_2008_2013.new("2012")
source_directory = "source_files/il2012/"
conference = scraper.scrape_conference(["#{source_directory}il2012-sunday.html","#{source_directory}il2012-monday.html","#{source_directory}il2012-tuesday.html","#{source_directory}il2012-wednesday.html"])
puts conference.to_xml