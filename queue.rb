class Queue
  def initialize
    @in = []
    @out = []
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
end
