# MaxMin Stack
class Stack
  def initialize
    @stack = []
  end

  def display
    @stack.map { |val, min, max| val }
  end

  def peek
    @stack.last[0] if valid?
  end

  def pop
    @stack.pop[0] if valid?
  end

  def empty?
    @stack.empty?
  end

  def push(val)
    if @stack.empty?
      @stack.push([val, val, val])
    else
      min, max = @stack.last[1], @stack.last[2]
      min = val if min > val
      max = val if max < val
      @stack.push([val, min, max])
    end
  end

  def min
    @stack.last[1] if valid?
  end

  def max
    @stack.last[2] if valid?
  end

  def valid?
    !@stack.empty?
    # if @stack.empty?
    #   puts 'No more items in the stack!'
    #   return false
    # end
    #
    # true
  end
end
