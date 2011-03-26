require 'Sort/BubbleSort'
require 'test/unit'

class BubbleSortTest < Test::Unit::TestCase
  def setup
    @array = Array.new()
    
    (1..500).each do |n|
      @array.push(1000*rand)
    end
  end
  
  def testShouldSortTheArrayUsingBubbleSort
    bubbleSorter = BubbleSort.new(@array)
    bubbleSorted = bubbleSorter.sort()
    
    prev = bubbleSorted[0]
    i = 0
    
    bubbleSorted.each do |n|
      assert(prev <= n, "Nao ordenou: i =  " + i.to_s + "; " + prev.to_s + " > " + n.to_s)
      i += 1
      prev = n
    end
  end
end