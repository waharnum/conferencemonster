require 'nokogiri'
require 'open-uri'

class Speaker
  def initialize(name, job_title,works_for)
    @name = name
    @job_title = job_title    
    @works_for = works_for
  end
end

class Session
  def initialize(title, description)
    @title = title
    @description = description
    @speakers = Array.new()
  end

  def add_speaker(speaker)
    @speakers.push(speaker)
  end

  def to_s()
    return "#{@title}, #{@description}, #{@speakers}"
  end

end

class Conference
  def initialize(title, year)
    @title = title
    @year = year
    @sessions = Array.new()
  end
  def add_session(session)
    @sessions.push(session)
  end
end

conference = Conference.new("Internet Librarian","2014")

# addies = ['il2014-monday.html','il2014-tuesday.html','il2014-wednesday.html','il2014-workshops.html']

addies = ['il2014-workshops.html']

addies.each do |addy|
	doc = Nokogiri::HTML(open(addy))
  
  doc.xpath('//div[contains(@class,"session")]').each_with_index do |session, session_index|    

  	session_title = session.xpath('h3[contains(@class,"session-title")]').inner_html
  	session_description = session.xpath('span[contains(@itemprop,"description")]').inner_html

    # puts "Index/Inspect: #{session_index} - #{session.inspect}"
    # puts "Title/Description: #{session_title} - #{session.description}"


    session_obj = Session.new(session_title, session_description)

  	# puts "#{session_title}"
    # puts "#{session_description}"
    session.xpath('div[contains(@class,"program-speaker")]').each do |session_speaker|
      speaker_name = session_speaker.xpath('a/span[contains(@itemprop, "name")]').inner_html
      speaker_job_title = session_speaker.xpath('span[contains(@itemprop, "jobTitle")]').inner_html
      speaker_works_for = session_speaker.xpath('span[contains(@itemprop, "worksFor")]/span[contains(@itemprop, "name")]').inner_html      
      # puts "\t#{speaker_name}, #{speaker_job_title}, #{speaker_works_for}"        
      speaker = Speaker.new(speaker_name,speaker_job_title,speaker_works_for)
      session_obj.add_speaker(speaker)
    end
    
    puts session_obj
    conference.add_session(session_obj)

	end
end
