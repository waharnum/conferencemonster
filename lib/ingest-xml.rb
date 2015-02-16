# il2009 = Conference.create(:title => "Internet Librarian 2009", :date => "2009-10-26")
# il2008 = Conference.new
# il2008.title = "Internet Librarian 2008"
# il2008.date = "2014-10-20"
# il2008.save

require 'nokogiri'

source_file = "../old/scrapers/il2008.xml"
doc = Nokogiri::HTML(open(source_file))      
# doc.encoding = 'utf-8'
doc.xpath("//session").each do | session |
	puts session.xpath("title").inner_html
end

