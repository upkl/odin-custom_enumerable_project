# frozen_string_literal: true

# re-implementation of the standard module
module Enumerable
  def my_each_with_index(&block)
    (0...length).each { |index| block.call(self[index], index) }
    self
  end

  def my_select(&block)
    result = []
    each { |x| result << x if block.call(x) }
    result
  end

  def my_all?(&block)
    each { |x| return false unless block.call(x) }
    true
  end

  def my_any?(&block)
    each { |x| return true if block.call(x) }
    false
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count(&block)
    return length if block.nil?

    result = 0
    each { |x| result += 1 if block.call(x) }
    result
  end

  def my_map(&block)
    result = []
    each { |x| result << block.call(x) }
    result
  end

  def my_inject(acc = 0, &block)
    each { |x| acc = block.call(acc, x) }
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    each { |x| block.call(x) }
    self
  end
end
