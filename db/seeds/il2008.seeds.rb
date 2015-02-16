# il2009 = Conference.create(:title => "Internet Librarian 2009", :date => "2009-10-26")
# il2008 = Conference.new
# il2008.title = "Internet Librarian 2008"
# il2008.date = "2014-10-20"
# il2008.save

require 'nokogiri'

source_file = "db/xml/il2008.xml"
conference =  Conference.find_by title: "Internet Librarian 2008"
doc = Nokogiri::HTML(open(source_file))      
# doc.encoding = 'utf-8'

doc.xpath("//session").each do | session |
	curr_title = session.xpath("title").inner_html
	curr_description = session.xpath("description").inner_html
	current_session = Session.create(:title => curr_title, :description => curr_description, :conference_id => conference.id)
	session.xpath("speakers/speaker").each do | speaker |
		curr_speaker_first_name = speaker.xpath("first_name").inner_html
		curr_speaker_last_name = speaker.xpath("last_name").inner_html
		Speaker.where(:first_name => curr_speaker_first_name, :last_name => curr_speaker_last_name).first_or_create.sessions << current_session
	end
end

# Speaker.where(:first_name => "Alan", :last_name => "Harnum").first_or_create.sessions
# Speaker.where(:first_name => "Alan", :last_name => "Harnum").first_or_create.sessions << Session.find(129)


