require 'pdf-reader'

pdf_file_name = "OLA-SC2012-program.pdf"
directory_name = "ola-sc2012"

reader = PDF::Reader.new(pdf_file_name)

puts reader.pdf_version
puts reader.info
# puts reader.metadata
puts reader.page_count

reader.pages.each_with_index { |page, page_number|  
	f = File.new("#{directory_name}/#{directory_name}-page-#{page_number}.txt", "w")	
	f.write(page.raw_content)
	f.close  
	puts "Page #{page_number} written."
}
  # puts page.text  
