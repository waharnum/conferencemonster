
require 'nokogiri'
require 'open-uri'

addies = ['http://internet-librarian.infotoday.com/2014/Workshops.aspx','http://internet-librarian.infotoday.com/2014/Monday.aspx','http://internet-librarian.infotoday.com/2014/Tuesday.aspx','http://internet-librarian.infotoday.com/2014/Wednesday.aspx']

addies.each do |addy|
	doc = Nokogiri::HTML(open(addy))
	doc.xpath('//div[contains(@class,"session")]').each do |session|
		puts session		
	end
end