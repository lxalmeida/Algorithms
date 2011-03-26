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

class MergeSort
  attr_reader :elapsedTime
  
  # Representa o +inf
  INFINITY = 2**32
  
  def initialize(array=nil)
    @arrayOrigin = array
    @array = nil
  end
  
  def array=(array)
    @arrayOrigin = array
    @array = nil
  end
  
  # Sort destrutivo (altera os valores do array original)
  def sort!
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    @array = @arrayOrigin
    merge_sort(0, @array.length-1)
  end

  # Sort não destrutivo
  def sort
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    @array = @arrayOrigin.dup()
    
    start = Time.now
    mergeSort(0, @array.length-1)
    finish = Time.now
    
    # Tempo de processamento
    @elapsedTime = finish - start 
    
    @array
  end
    
  private
    # Algoritmo principal
    def mergeSort(lo, hi)
      # Divide enquanto índice o inferior for menor que o superior
      if lo < hi
        # Divide ao meio (arrendondamento para baixo)
        m = (hi + lo) / 2
        # Recursão nas metades esquerda e direita
        mergeSort(lo, m)
        mergeSort(m+1, hi)
        # Intercala as metades
        merge(lo, m, hi)
      end
    end
    # Método de intercalação
    def merge(lo, m, hi)
      # Determina o tamanho das metades a serem intercaladas
      n1 = m - lo
      n2 = hi - m
      # Isola ambas metades em novos arrays (isso acaba elevando as constantes do algoritmo...)
      lArray = @array[lo..lo+n1]
      rArray = @array[m+1..m+n2]
      lArray.push(INFINITY)
      rArray.push(INFINITY)
      
      i, j = 0, 0
      # Percorre a região do vetor sendo ordenado,
      # que abrange ambas as metades sendo intercaladas
      (lo..hi).each do |k|
        # Compara os valores de lArray e rArray, e organiza os valores
        # de forma ordenada no intervalo [lo..hi]
        if lArray[i] <= rArray[j]
          @array[k] = lArray[i]
          i += 1
        else
          @array[k] = rArray[j]
          j += 1
        end
      end
    end
end