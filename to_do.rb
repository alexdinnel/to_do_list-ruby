require './lib/to_do_list'

@list = []
@done =[]


def main_menu
  puts "Press 'A' to add a task"
  puts "Press 'L' to list all of your tasks"
  puts "Press 'D' to delete task"
  puts "Press 'X' to exit"
  puts "Press 'F' to show finished taskes"
  main_choice = gets.chomp
  if main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice =='x'
    puts "Good-bye!"
  elsif main_choice == 'd'
    delete_task
  elsif main_choice == 'f'
    list_finished
  else
    puts "Sorry, that wasn't a valid option."
    main_menu
  end
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
  main_menu
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each_with_index do |task, index|
    puts (index + 1).to_s + ". " + task.description
  end
  puts "\n"
  main_menu
end

def delete_task
  puts "Which task are finished?"
  user_input = gets.chomp.to_i - 1
  @list.each_with_index do |task, index|
    if user_input == index
      @list.delete_at(index)
    end
  end
  list_tasks
end

main_menu
