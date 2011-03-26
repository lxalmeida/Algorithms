require 'Sort/InsertionSort'
require 'test/unit'

class InsertionSortTest < Test::Unit::TestCase
  def setup
    @array = Array.new()
    
    (1..500).each do |n|
      @array.push(1000*rand)
    end
  end
  
  def testSholdSortTheArrayUsingInsertionSort
    insertionSorter = InsertionSort.new(@array)
    insertionSorted = insertionSorter.sort()
    
    prev = insertionSorted[0]
    i = 0
    
    insertionSorted.each do |n|
      assert(prev <= n, "Nao ordenou: i =  " + i.to_s + "; " + prev.to_s + " > " + n.to_s)
      i += 1
      prev = n
    end
  end
end