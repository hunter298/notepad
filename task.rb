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

    puts "К какому числу нужно сделать? (dd.mm.yyyy.)"
    input = STDIN.gets.chomp
    @due_date = Date.parse input

  end
end