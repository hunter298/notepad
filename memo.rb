class Memo < Post

  def to_strings

    time_sting = "Created: #{@created_at.strftime("%Y-%m-%d, %H-%M-%S")}  \n\r"

    return @text.unshift time_sting

  end

  def read_from_console
    puts "Новая заметка - все что напишете до строчки end:"
    @text = []
    line = nil

    while line != 'end' do
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end
end