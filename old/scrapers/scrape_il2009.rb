require './scraper_internet_librarian_2008_2013'

scraper = Scraper_Internet_Librarian_2008_2013.new("2009")
source_directory = "source_files/il2009/"
conference = scraper.scrape_conference(["#{source_directory}il2009-saturday.html","#{source_directory}il2009-sunday.html","#{source_directory}il2009-monday.html","#{source_directory}il2009-tuesday.html","#{source_directory}il2009-wednesday.html"])
puts conference.to_xml