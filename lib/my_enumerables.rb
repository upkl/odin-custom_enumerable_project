module Enumerable
  def my_each_with_index(&block)
    for index in (0...self.length)
      block.call(self[index], index)
    end
    self
  end

  def my_select(&block)
    result = []
    for x in self
      result << x if block.call(x)
    end
    result
  end

  def my_all?(&block)
    for x in self
      return false unless block.call(x)
    end
    true
  end

  def my_any?(&block)
    for x in self
      return true if block.call(x)
    end
    false
  end

  def my_none?(&block)
    not my_any?(&block)
  end

  def my_count(&block)
    if block.nil?
      return self.length
    end
    result = 0
    for x in self
      result += 1 if block.call(x)
    end
    result
  end

  def my_map(&block)
    result = []
    for x in self
      result << block.call(x)
    end
    result
  end

  def my_inject(acc=0, &block)
    for x in self
      acc = block.call(acc, x)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    for x in self
      block.call(x)
    end
    self
  end
end

