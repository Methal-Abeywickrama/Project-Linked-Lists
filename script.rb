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
end

# the class for the node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
