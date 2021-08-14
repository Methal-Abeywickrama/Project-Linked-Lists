# frozen_string_literal: true

# the class for the linked list
class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    new_node = Node.new(value)
    @list.push(new_node)
    @list.last.next_node = @list.index(new_node)
  end

  def prepend(value)
    new_node = Node.new(value)
    @list.shift(new_node)
    @list[0].next_node = 1
  end

  def size
    @list.length
  end

  def head
    @list[0]
  end

  def tail
    @list.last
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
  end

  def contains?(value)
    @list.any? { |n| n.value == value }
  end

  def find(value)
    @list.each_with_index { |n, i| return i if n.value == value }
  end

  def to_s
    @list.each { |i| print "( #{i} ) -> " }
    print 'nil'
  end

  def insert_at(value, index)
    front_arr = @list[0..index - 1]
    back_arr = @list[index + 1..]
    back_arr.each { |v| v.next_node += 1 }
    front_arr.push(Node.new(value, index))
    @list = front_arr + back_arr
  end

  def remove_at(index)
    front_arr = @list[0..index - 1]
    back_arr = @list[index + 1..]
    back_arr.each { |v| v.next_node -= 1 }
    @list = front_arr + back_arr
  end
end

# the class for the node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
