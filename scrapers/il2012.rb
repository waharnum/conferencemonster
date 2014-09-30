require './il2013'



class InternetLibrarian2012Scraper < InternetLibrarian2013Scraper
  def initialize
    super
  end

  def init_scraper_conference()
    return Conference.new("Internet Librarian","2012")
  end
end  