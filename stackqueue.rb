require './stack'

class StackQueue
  def initialize
    @in = Stack.new
    @out = Stack.new
  end

  def enqueue(val)
    @in.push(val)
  end

  def dequeue
    return 'No more items left!' if @in.empty? && @out.empty?
    if @out.empty?
      @out.push(@in.pop) until @in.empty?
    end

    @out.pop
  end

  def max
    [@in.max, @out.max].max
  end

  def min
    [@in.min, @out.min].min
  end
end
