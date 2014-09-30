require 'nokogiri'
require 'open-uri'

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
  
  # Must return an appropriate Conference object
  def init_scraper_conference()
    raise NotImplementedError, "You must implement the init_conference method!"
  end

  # Scrape an array of conference_pages and returns a Conference object
  
  def scrape_conference(conference_pages)
    conference = init_scraper_conference()    
    conference_pages.each do |page|
      doc = Nokogiri::HTML(open(page))      
      doc.encoding = 'utf-8'
      doc.xpath(session_xpath).each do |session|
               
        session_title = extract_session_title(session.xpath(session_title_xpath).inner_html)                
        session_description = extract_session_description(session.xpath(session_description_xpath).inner_html)

        session_obj = Session.new(session_title, session_description)
        
        session.xpath(speaker_xpath).each do |session_speaker|          
          speaker_name = extract_speaker_name(session_speaker.xpath(speaker_name_xpath).inner_html)          
          speaker_job_title = extract_speaker_job_title(session_speaker.xpath(speaker_job_title_xpath).inner_html)          
          speaker_works_for = extract_speaker_works_for(session_speaker.xpath(speaker_works_for_xpath).inner_html)      
          speaker = Speaker.new(speaker_name,speaker_job_title,speaker_works_for)
          session_obj.add_speaker(speaker)
        end

        conference.add_session(session_obj)

      end
    end
    
    return conference
  end
end

# extract_ functions below can be re-implemented in derived classes for processing the strings returned by the xpath statements

def extract_session_title(s)
  return s
end

def extract_session_description(s)
  return s
end

def extract_speaker_name(s)
  return s
end

def extract_speaker_job_title(s)
  return s
end

def extract_speaker_works_for(s)
  return s
end

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