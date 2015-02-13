require './scraper_internet_librarian_2008_2013'

scraper = Scraper_Internet_Librarian_2008_2013.new("2008")
source_directory = "source_files/il2008/"
conference = scraper.scrape_conference(["#{source_directory}il2008-saturday.html","#{source_directory}il2008-sunday.html","#{source_directory}il2008-monday.html","#{source_directory}il2008-tuesday.html","#{source_directory}il2008-wednesday.html"])
puts conference.to_xml