require './scraper_internet_librarian_2008_2013'

scraper = Scraper_Internet_Librarian_2008_2013.new("2010")
source_directory = "source_files/il2010/"
conference = scraper.scrape_conference(["#{source_directory}il2010-saturday.html","#{source_directory}il2010-sunday.html","#{source_directory}il2010-monday.html","#{source_directory}il2010-tuesday.html","#{source_directory}il2010-wednesday.html"])
puts conference.to_xml