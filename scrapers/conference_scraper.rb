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