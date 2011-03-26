require 'Sort/QuickSort'
require 'test/unit'

class QuickSortTest < Test::Unit::TestCase
  def setup
    @array = Array.new()
    
    (1..500).each do |n|
      @array.push(1000*rand)
    end
  end
  
  def testShouldSortTheArrayUsingQuickSort
    quickSorter = QuickSort.new(@array)
    quickSorted = quickSorter.sort()
    
    prev = quickSorted[0]
    i = 0
    
    quickSorted.each do |n|
      assert(prev <= n, "Nao ordenou: i =  " + i.to_s + "; " + prev.to_s + " > " + n.to_s)
      i += 1
      prev = n
    end
  end
end