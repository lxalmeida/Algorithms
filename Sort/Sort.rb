# Copyright 2010 Alexandre Almeida
# This file is part of Algorithms Package.
#
# Algorithms Package is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Foobar is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

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

