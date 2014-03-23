require 'nokogiri'

file_name, second, third = ARGV

file = File.open(file_name, "r")
table_string = file.read
file.close
doc = Nokogiri::HTML(table_string)

doc.xpath('//table//tr').each do |row|
  row.xpath('td').each do |cell|
    print '"', cell.text.strip().gsub("\n", ' ').gsub('"', '\"').gsub(/(\s){2,}/m, '\1'), "\", "
  end
  print "\n"
end
