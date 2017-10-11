# todolist_test.rb
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todo4 = Todo.new("Finish Ccding")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) do
      @list.add(5)
    end
  end

  def test_shovel
    assert_equal([@todo1, @todo2, @todo3, @todo4], @list << @todo4)
  end

  def test_add
    assert_equal([@todo1, @todo2, @todo3, @todo4], @list.add(@todo4))
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) do
      @list.item_at(20)
    end
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(20) }
    assert_equal(true, @list.mark_done_at(0))
    assert_equal(true, @list.mark_done_at(1))
    assert_equal(true, @list.mark_done_at(2))
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(20) }
    @list.mark_all_done
    assert_equal(false, @list.mark_undone_at(0))
    assert_equal(false, @list.mark_undone_at(1))
    assert_equal(false, @list.mark_undone_at(2))
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(20) }
    assert_equal(@todo3, @list.remove_at(2))
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_1_todo_done
    @todo2.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_todo_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each do |todo|
      todo.done!
    end

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_each_return
    each_return = @list.each { |todo| nil }

    assert_equal(each_return, @list)
  end

  def test_select
    list = TodoList.new(@list.title)
    @todo1.done!
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
    assert_equal(@todo2, @list.find_by_title("Clean room"))
    assert_equal(@todo3, @list.find_by_title("Go to gym"))
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    @list.mark_done("Go to gym")

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
end
