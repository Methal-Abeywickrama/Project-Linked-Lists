# frozen_string_literal: true

# the class for the linked list
class LinkedList
  def initialize
    @list = []
    @head = nil
    @tail = nil
    @second = nil
    @second_last = nil
    @size = 0
  end

  def append(value)
    if @head.nil? && @tail.nil?
      prepend(value)
    else
      new_node = Node.new(value)
      if tail.nil?
        @head.next_node = new_node
      else
        @tail.next_node = new_node
      end
      @tail = new_node
      @size += 1
    end
  end

  def prepend(value)
    if @head.nil? && @tail.nil?
      new_node = Node.new(value)
      @head = new_node
    else
      if tail.nil?
        @tail = @head.clone
        @head = Node.new(value, @tail)
      else 
        @head = Node.new(value, @head.clone)
      end
    end
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if @head.nil?

    current_node = @head
    count = 0
    while count <= index
      return nil if current_node.nil?
      if index == count
        return current_node
      else
        count += 1
        current_node = current_node.next_node
      end
    end
  end

  def pop
    return nil if @head.nil?

    current_node = @head
    the_next_node = current_node.next_node
    while 2.positive?
      if the_next_node == @tail
        @tail = current_node
        @tail.next_node = nil
        return the_next_node
      else
        current_node = the_next_node
        the_next_node = current_node.next_node
      end
    end
  end

  def contains?(value)
    return false if @head.nil?

    current_node = @head
    while 2.positive?
      return false if current_node.value.nil?

      return true if value == current_node.value

      current_node = current_node.next_node
    end
  end

  def find(value)
    index = 0
    current_node = @head
    while 2.positive?
      return nil if current_node.value.nil?

      return index if value == current_node.value

      current_node = current_node.next_node
      index += 1
    end
  end

  def to_s
    return 'nil' if @head.nil?
    the_string = ""
    reached_tail = false
    current_node = @head
    until reached_tail
      reached_tail = true if current_node == @tail
      the_string = the_string + "#{( current_node.value ) -> }"
    end
  end

  def insert_at(value, index)
    prepend(value) if index == 0
    current_node = @head
    the_next_node = @head.next_node
    count = 0
    until count == index - 1
      append(value) if current_node.nil?
      current_node = the_next_node
      the_next_node = current_node.next_node
      count += 1
    end
    new_node = Node.new(value, the_next_node)
    current_node.next_node = new_node
  end

  def remove_at(index)
    @head = @head.next_node if index == 0
    previous_node = @head
    current_node = @head.next_node
    count = 0
    until count == index + 1
      return nil if current_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = current_node.next_node
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
