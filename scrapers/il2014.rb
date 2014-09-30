require 'nokogiri'
require 'open-uri'
require './conference_scraper'

class InternetLibrarian2014Scraper < ConferenceScraper
  
  def initialize
    super(session_xpath = '//div[@class="session"]',session_title_xpath = 'h3[@class="session-title"]',session_description_xpath = 'span[@itemprop="description"]',speaker_xpath = 'div[@class="program-speaker"]',speaker_name_xpath = 'a/span[@itemprop="name"]',speaker_job_title_xpath = 'span[@itemprop="jobTitle"]',speaker_works_for_xpath = 'span[@itemprop="worksFor"]/span[contains(@itemprop, "name")]')
  end
  
  def scrape_conference(conference_pages)
    conference = Conference.new("Internet Librarian","2013")
    conference_pages.each do |page|
      doc = Nokogiri::HTML(open(page))      
      doc.encoding = 'utf-8'
      doc.xpath(session_xpath).each do |session|
               
        session_title = session.xpath(session_title_xpath).inner_html                
        session_description = session.xpath(session_description_xpath).inner_html

        session_obj = Session.new(session_title, session_description)
        
        session.xpath(speaker_xpath).each do |session_speaker|          
          speaker_name = session_speaker.xpath(speaker_name_xpath).inner_html          
          speaker_job_title = extract_speaker_job_title(session_speaker.xpath(speaker_job_title_xpath).inner_html)          
          speaker_works_for = extract_speaker_works_for(session_speaker.xpath(speaker_works_for_xpath).inner_html)      
          speaker = Speaker.new(speaker_name,speaker_job_title,speaker_works_for)
          session_obj.add_speaker(speaker)
        end

        conference.add_session(session_obj)

      end
    end
    
    puts conference.to_xml
  end
  
end

scraper = InternetLibrarian2014Scraper.new
scraper.scrape_conference(['il2014-monday.html','il2014-tuesday.html','il2014-wednesday.html','il2014-workshops.html'])