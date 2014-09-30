require './il2013'

scraper = InternetLibrarian2013Scraper.new
source_directory = "source_files/il2013/"
conference = scraper.scrape_conference(["#{source_directory}il2013-workshops.html","#{source_directory}il2013-monday.html","#{source_directory}il2013-tuesday.html","#{source_directory}il2013-wednesday.html"])
puts conference.to_xml