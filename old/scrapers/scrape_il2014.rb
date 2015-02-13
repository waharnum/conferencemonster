require './/scraper_internet_librarian_2014'

scraper = Scraper_Internet_Librarian_2014.new
source_directory = "source_files/il2014/"
conference = scraper.scrape_conference(["#{source_directory}il2014-monday.html","#{source_directory}il2014-tuesday.html","#{source_directory}il2014-wednesday.html","#{source_directory}il2014-workshops.html"])
puts conference.to_xml