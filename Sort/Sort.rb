require 'Sort/MergeSort'
require 'Sort/HeapSort'
require 'Sort/BubbleSort'
require 'Sort/InsertionSort'
require 'Sort/QuickSort'

a = Array.new

(1..10000).each do |n|
  a.push(1000*rand)
end

quickSorter = QuickSort.new(a)
quickSorted = quickSorter.sort()

puts "QuickSort time = " + quickSorter.elapsedTime().to_s() + " s"

heapSorter = HeapSort.new(a)
heapSorted = heapSorter.sort()

puts "HeapSort time = " + heapSorter.elapsedTime().to_s() + " s"

mergeSorter = MergeSort.new(a)
mergeSorted = mergeSorter.sort()

puts "MergeSort time = " + mergeSorter.elapsedTime().to_s() + " s"

#insertionSorter = InsertionSort.new(a)
#insertionSorted = insertionSorter.sort()

#puts "InsertionSort time = " + insertionSorter.elapsedTime().to_s() + " s"

#bubbleSorter = BubbleSort.new(a)
#bubbleSorted = bubbleSorter.sort()

#puts "BubbleSort time = " + bubbleSorter.elapsedTime().to_s() + " s"

