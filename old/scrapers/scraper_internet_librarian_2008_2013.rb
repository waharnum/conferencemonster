require './conference_scraper'

class Scraper_Internet_Librarian_2008_2013 < ConferenceScraper
  attr_reader :conference_year
  def initialize(conference_year)
    super(session_xpath = '//td[child::a[contains(@name,"session_")]]',session_title_xpath = 'span[@class = "parahead"]',session_description_xpath = 'p',speaker_xpath = 'descendant::a[contains(@href,"speakers.asp?speaker=")]',speaker_name_xpath = '.',speaker_job_title_xpath = '../following-sibling::em[1]',speaker_works_for_xpath = '../following-sibling::em[1]')
      @conference_year = conference_year
  end

  def init_scraper_conference()
    return Conference.new("Internet Librarian",conference_year)
  end
  
def extract_speaker_job_title(s)
  if (s.split(",")[1].respond_to?('strip'))
    return s.split(",")[1].strip
  else return s[1]
  end
end

def extract_speaker_works_for(s)  
  if (s.split(",",3)[2].respond_to?('strip'))
    return s.split(",",3)[2].strip
  else return s[2]
  end
end

end