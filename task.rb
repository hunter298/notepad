require 'date'

class Task < Post

  def initialize
    super

    @due_date = Time.now
  end

  def to_strings

    time_sting = "Created: #{@created_at.strftime("%Y-%m-%d, %H-%M-%S")} \n\r \n\r"

    deadline = "Крайний срок: #{@due_date}"

    return [deadline, @text, time_sting]

  end

  def read_from_console

    puts "Чта надо сделать?"
    @text = STDIN.gets.chomp

    puts "К какому числу нужно сделать? (dd.mm.yyyy)"
    input = STDIN.gets.chomp
    @due_date = Date.parse(input).strftime("%d-%m-%Y %H:%M:%S")

  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text,
            'due_date' => @due_date
        }
    )

  end

  def load_data data_hash
    super data_hash
    @text = data_hash['text']
    @due_date = Date.parse data_hash['due_date']
  end
end