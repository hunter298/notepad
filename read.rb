require_relative 'post'
require_relative 'link'
require_relative 'memo'
require_relative 'task'

require 'sqlite3'

require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'какой тип постов показывать (по умолчанию любой)') {|o| options[:type] = o } #
  opt.on('--id POST_ID', 'если задан id - показываем подробно только этот пост)') {|o| options[:id] = o } #
  opt.on('--limit NUMBER', 'сколько последних постов показывать (по умолчанию все)') {|o| options[:limit] = o } #

end.parse!

result = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post
  puts "Запись #{result.class.name}, id = #{options[:id]}"
  result.to_strings.each do |line|
    puts line
  end
else
  puts "| id \t| type \t | created at \t\t\t | text \t\t\t | url \t\t | due \t "
  result.each do |row|
    puts
    row.each do |element|
      print "| #{element.to_s[0..40]}\t"
    end
    puts
  end
end