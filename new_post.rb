require_relative 'post'
require_relative 'link'
require_relative 'memo'
require_relative 'task'

puts "ПриветЁ я блокнот (SQLite version), что хочешь записать?"

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size

  choices.each_with_index do |item, ind|
    puts "\t #{ind}. #{item}"
  end

  choice = STDIN.gets.chomp.to_i

end

entry = Post.create choices[choice]

entry.read_from_console

id = entry.save_to_db

puts "\nУра, запись сохранена! ID number #{id}"