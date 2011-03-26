require 'Sort/HeapSort'
require 'test/unit'

class HeapSortTest < Test::Unit::TestCase
  def setup
    @array = Array.new()
    
    (1..10000).each do |n|
      @array.push(1000*rand)
    end
  end
  
  def testShouldSortTheArrayUsingHeapSort
    heapSorter = HeapSort.new(@array)
    heapSorted = heapSorter.sort()
    
    prev = heapSorted[0]
    i = 0
    
    heapSorted.each do |n|
      assert(prev <= n, "Nao ordenou: i =  " + i.to_s + "; " + prev.to_s + " > " + n.to_s)
      i += 1
      prev = n
    end
  end
end