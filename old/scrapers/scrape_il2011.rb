require './scraper_internet_librarian_2008_2013'

scraper = Scraper_Internet_Librarian_2008_2013.new("2011")
source_directory = "source_files/il2011/"
conference = scraper.scrape_conference(["#{source_directory}il2011-saturday.html","#{source_directory}il2011-sunday.html","#{source_directory}il2011-monday.html","#{source_directory}il2011-tuesday.html","#{source_directory}il2011-wednesday.html"])
puts conference.to_xml