# TODO: Improve LRUCache to use doubly linked and stores node inside the @cache

class Node
  attr_accessor :val, :next_node
  def initialize(val, next_node = nil, prev_node = nil)
    @val = val
    @next_node = next_node
    @prev_node = prev_node
  end

  def remove
    @prev_node.next_node = next_node
  end
end

class LinkedList
  attr_accessor :link_length
  def initialize
    @head = nil
    @link_length = 0
  end

  def add_link(new_val)
    if @head.nil?
      @head = Node.new(new_val)
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      new_node = Node.new(new_val)
      current.next_node = new_node
      new_node.prev_node = current
    end
    @link_length += 1
  end

  def delete_link(val)
    current = @head
    previous = nil
    # until current.val == val
    #   previous = current
    #   current = current.next_node
    # end

    if current == @head
      @head = current.next_node
    else
      current.remove
      # previous.next_node = current.next_node
      # current.next_node = nil
    end
    @link_length -= 1
  end

  def remove_oldest
    old = @head
    @head = @head.next_node
    @link_length -= 1
    old.val
  end
end

class LRUCache
  attr_accessor :cache, :history, :prc
  def initialize(&prc)
    @cache = {}
    @history = LinkedList.new
    @prc = prc
  end

  def add(key, value)
    if @cache.has_key?(key)
      raise 'Already exists'
    else
      @history.add_link(key)
      @cache[key] = value
    end
  end

  def get(input)
    if @cache.has_key?(input)
      val = @cache[input]
      @history.delete_link(input)
      @history.add_link(input)
      val
    else
      nil
    end
  end

  def get_with_proc(input)
    key = @prc.call(input)
    get(key)
  end

  def put(key, value)
    @history.add_link(key)
    @cache[key] = value
    remove_lru
  end

  def remove(key)
    @history.delete_link(key)
    @cache[key] = nil
  end

  def remove_lru
    until @history.link_length <= 500
      old_val = @history.remove_oldest
      @cache[old_val] = nil
    end
  end
end
