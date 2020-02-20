require_relative 'post'
require_relative 'link'
require_relative 'memo'
require_relative 'task'

puts "ПриветЁ я блокнот, что хочешь записать?"

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size

  choices.each_with_index do |item, ind|
    puts "\t #{ind}. #{item}"
  end

  choice = STDIN.gets.chomp.to_i

end

entry = Post.create choice

entry.read_from_console

entry.save

puts "\nУра, запись сохранена!"