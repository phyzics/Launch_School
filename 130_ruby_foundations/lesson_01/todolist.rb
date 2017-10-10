# todolist.rb
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError.new("Can only add Todo objects") if todo.class != Todo

    todos << todo
  end
  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    str = "---- #{title} ----\n"
    str << todos.map(&:to_s).join("\n")
    str
  end

  def done!
    todos.each do |item|
      item.done!
    end
  end

  def done?
    todos.all?(&:done?)
  end

  def each
    counter = 0

    while counter < todos.size do
      yield(todos[counter])
      counter += 1
    end

    self
  end

  def select
    results = TodoList.new(title)
    each do |item|
      results << item if yield(item)
    end
    results
  end

  private

  attr_reader :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list << todo3

todo1.done!

results = list.select { |todo| todo.done? }

puts results.inspect
