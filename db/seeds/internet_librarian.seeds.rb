require 'nokogiri'
require_relative './xml_seeder'

seeder = XMLSeeder.new("db/xml/il2008.xml","Internet Librarian 2008")
seeder.seed_from_xml

seeder = XMLSeeder.new("db/xml/il2009.xml","Internet Librarian 2009")
seeder.seed_from_xml

seeder = XMLSeeder.new("db/xml/il2010.xml","Internet Librarian 2010")
seeder.seed_from_xml

seeder = XMLSeeder.new("db/xml/il2011.xml","Internet Librarian 2011")
seeder.seed_from_xml

seeder = XMLSeeder.new("db/xml/il2012.xml","Internet Librarian 2012")
seeder.seed_from_xml

seeder = XMLSeeder.new("db/xml/il2013.xml","Internet Librarian 2013")
seeder.seed_from_xml

seeder = XMLSeeder.new("db/xml/il2014.xml","Internet Librarian 2014")
seeder.seed_from_xml