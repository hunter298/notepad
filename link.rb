class Link < Post

  def initialize
    super

    @url = ''
  end

  def to_strings
    time_sting = "Created: #{@created_at.strftime("%Y-%m-%d, %H-%M-%S")} \n\r \n\r"

    return [@url, @text, time_sting]


  end

  def read_from_console

    puts "Введите ссылку:"
    @url = STDIN.gets.chomp

    puts "Что за ссылка?"
    @text = STDIN.gets.chomp

  end
end