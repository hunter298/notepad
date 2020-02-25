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

  def to_db_hash
    return super.merge(
        {
            'text' => @text.join("\n\r")
        }
    )
  end

  def load_data data_hash
    super data_hash

    @text = data_hash['text']
  end
end