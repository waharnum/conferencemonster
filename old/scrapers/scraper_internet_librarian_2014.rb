require './conference_scraper'

class Scraper_Internet_Librarian_2014 < ConferenceScraper

  def init_scraper_conference()
    return Conference.new("Internet Librarian","2014")
  end
  
  def initialize
    super(session_xpath = '//div[@class="session"]',session_title_xpath = 'h3[@class="session-title"]',session_description_xpath = 'span[@itemprop="description"]',speaker_xpath = 'div[@class="program-speaker"]',speaker_name_xpath = 'a/span[@itemprop="name"]',speaker_job_title_xpath = 'span[@itemprop="jobTitle"]',speaker_works_for_xpath = 'span[@itemprop="worksFor"]/span[contains(@itemprop, "name")]')
  end
    
end