require 'nokogiri'
require 'open-uri'
require './conference_scraper'

class InternetLibrarian2014Scraper < ConferenceScraper

  def init_scraper_conference()
    return Conference.new("Internet Librarian","2014")
  end
  
  def initialize
    super(session_xpath = '//div[@class="session"]',session_title_xpath = 'h3[@class="session-title"]',session_description_xpath = 'span[@itemprop="description"]',speaker_xpath = 'div[@class="program-speaker"]',speaker_name_xpath = 'a/span[@itemprop="name"]',speaker_job_title_xpath = 'span[@itemprop="jobTitle"]',speaker_works_for_xpath = 'span[@itemprop="worksFor"]/span[contains(@itemprop, "name")]')
  end
    
end

scraper = InternetLibrarian2014Scraper.new
conference = scraper.scrape_conference(['il2014-monday.html','il2014-tuesday.html','il2014-wednesday.html','il2014-workshops.html'])
puts conference.to_xml