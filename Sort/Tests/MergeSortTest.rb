require 'Sort/MergeSort'
require 'test/unit'

class MergeSortTest < Test::Unit::TestCase
  def setup
    @array = Array.new()
    
    (1..500).each do |n|
      @array.push(1000*rand)
    end
  end
  
  def testShouldSortTheArrayUsingMergeSort
    mergeSorter = MergeSort.new(@array)
    mergeSorted = mergeSorter.sort()
    
    prev = mergeSorted[0]
    i = 0
    
    mergeSorted.each do |n|
      assert(prev <= n, "Nao ordenou: i =  " + i.to_s + "; " + prev.to_s + " > " + n.to_s)
      i += 1
      prev = n
    end
  end
end