require 'nokogiri'
require 'open-uri'

class Speaker
  attr_reader :name
  attr_reader :job_title
  attr_reader :works_for
  def initialize(name, job_title,works_for)
    @name = name
    @job_title = job_title    
    @works_for = works_for
  end
end

class Session
  attr_reader :title
  attr_reader :description
  attr_reader :speakers
  def initialize(title, description)
    @title = title
    @description = description
    @speakers = Array.new()
  end

  def add_speaker(speaker)
    @speakers.push(speaker)
  end

end

class Conference
  attr_reader :title
  attr_reader :year
  attr_reader :sessions
  def initialize(title, year)
    @title = title
    @year = year
    @sessions = Array.new()
  end
  def add_session(session)
    @sessions.push(session)
  end
  def to_xml()
    builder = Nokogiri::XML::Builder.new do |xml|
  xml.conference{
    xml.title title
    xml.year year
    xml.sessions {
      sessions.each do |s|
        xml.session {
          xml.title s.title
          xml.description s.description
          xml.speakers {
            s.speakers.each do |speaker|
              xml.speaker{
                xml.name speaker.name                
                xml.job_title speaker.job_title
                xml.works_for speaker.works_for
              } 
            end
          }
        }
      end
    }
  }
  end
     return builder.to_xml
  end
end

class ConferenceScraper
  attr_reader :session_xpath
  attr_reader :session_title_xpath
  attr_reader :session_description_xpath
  attr_reader :speaker_xpath
  attr_reader :speaker_name_xpath
  attr_reader :speaker_job_title_xpath
  attr_reader :speaker_works_for_xpath
  def initialize(session_xpath,session_title_xpath,session_description_xpath,speaker_xpath,speaker_name_xpath,speaker_job_title_xpath,speaker_works_for_xpath)
    @session_xpath = session_xpath
    @session_title_xpath = session_title_xpath
    @session_description_xpath = session_description_xpath
    @speaker_xpath = speaker_xpath
    @speaker_name_xpath = speaker_name_xpath
    @speaker_job_title_xpath = speaker_job_title_xpath
    @speaker_works_for_xpath = speaker_works_for_xpath
  end
  
  def scrape_conference(conference_pages)
    raise NotImplementedError, "You must implement the scrape_conference method"
  end
end

class InternetLibrarian2014Scraper < ConferenceScraper
  
  def initialize
    super(session_xpath = '//div[@class="session"]',session_title_xpath = 'h3[@class="session-title"]',session_description_xpath = 'span[@itemprop="description"]',speaker_xpath = 'div[@class="program-speaker"]',speaker_name_xpath = 'a/span[@itemprop="name"]',speaker_job_title_xpath = 'span[@itemprop="jobTitle"]',speaker_works_for_xpath = 'span[@itemprop="worksFor"]/span[contains(@itemprop, "name")]')
  end
  
  def scrape_conference(conference_pages)
    conference = Conference.new("Internet Librarian","2014")
    conference_pages.each do |page|
      doc = Nokogiri::HTML(open(page))
      doc.xpath(session_xpath).each do |session|    

        session_title = session.xpath(session_title_xpath).inner_html
        session_description = session.xpath(session_description_xpath).inner_html

        session_obj = Session.new(session_title, session_description)

        session.xpath(speaker_xpath).each do |session_speaker|
          speaker_name = session_speaker.xpath(speaker_name_xpath).inner_html
          speaker_job_title = session_speaker.xpath(speaker_job_title_xpath).inner_html
          speaker_works_for = session_speaker.xpath(speaker_works_for_xpath).inner_html      
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