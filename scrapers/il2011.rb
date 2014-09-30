require './il2013'



class InternetLibrarian2011Scraper < InternetLibrarian2013Scraper
  def initialize
    super
  end

  def init_scraper_conference()
    return Conference.new("Internet Librarian","2011")
  end
end    