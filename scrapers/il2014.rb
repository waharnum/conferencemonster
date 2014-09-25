
require 'nokogiri'
require 'open-uri'

addies = ['il2014-monday.html','il2014-tuesday.html','il2014-wednesday.html','il2014-workshops.html']

addies.each do |addy|
	doc = Nokogiri::HTML(open(addy))
  doc.xpath('//div[contains(@class,"session")]').each do |session|
    session.xpath('div[contains(@class,"program-speaker")]').each do |session_speaker|
      # puts "SPEAKER: #{session_speaker}"
      session_speaker.xpath('a/span[contains(@itemprop, "name")]').each do |speaker_name|
        puts "\t#{speaker_name.content}"
      end
    end
	end
end