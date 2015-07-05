class Node
  attr_accessor :val, :next_node, :prev_node

  def initialize(val, next_node = nil, prev_node = nil)
    @val = val
    @next_node = next_node
    @prev_node = prev_node
  end
end

class LinkedList
  def initialize(val)
    @head = Node.new(val)

    puts 'Created a new linked list.'
  end

  def show_all
    current = @head
    list = []
    until current.nil?
      list << current.val
      current = current.next_node
    end
  end

  def add_link(val)
    current = @head
    current = current.next_node until current.next_node.nil?
    new_node = Node.new(val)
    current.next_node = new_node

    puts "Added link with value: #{new_node.val}."
  end

  def remove_link(n)
    current, previous = @head, nil
    count = 1
    until count == n
      if current.next_node
        previous = current
        current = current.next_node
        count += 1
      else
        puts 'Outside the length of the linked list!'
        break
      end
    end

    if count == n
      previous.next_node = current.next_node
      puts "Removed link at position #{n}."
      show_all
    else
      puts 'Link removal aborted.'
    end
  end
end

class SinglyLinkedList < LinkedList
  def show_all
    super
    puts "Linked List: #{list.join(' -> ')}"
  end
end

class DoublyLinkedList < LinkedList
  def show_all
    super
    puts "Linked List: #{list.join(' <-> ')}"
  end

  def add_link
    super
    new_node.prev_node = current
  end

  def remove_link(n)
    current, previous = @head, nil
    count = 1
    until count == n
      if current.next_node
        previous = current
        current = current.next_node
        count += 1
      else
        puts 'Outside the length of the linked list!'
        break
      end
    end

    if count == n
      previous.next_node = current.next_node
      current.next_node.prev_node = previous
      puts "Removed link at position #{n}."
      show_all
    else
      puts 'Link removal aborted.'
    end
  end
end
