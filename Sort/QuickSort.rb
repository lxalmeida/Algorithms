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

class QuickSort
  attr_reader :elapsedTime
  
  def initialize(array=nil, shuffle=true)
    @arrayOrigin = array
    @array = nil
    @shuffle = shuffle
  end
  
  def array=(array)
    @arrayOrigin = array
    @array = nil
  end
  
  # Sort destrutivo (altera os valores do array original)
  def sort!(shuffle=true)
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    @array = @arrayOrigin
    # Embaralha os elementos do array para o QuickSort
    # não cair no pior caso O(n^2), que acontece quando
    # o array já está ordenado
    @array.shuffle! if shuffle
    
    quickSort(0, @array.length-1)
  end
  
  # Sort não destrutivo
  def sort(shuffle=true)
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    # Duplica o array
    @array = @arrayOrigin.dup()
    # Embaralha os elementos do array para o QuickSort
    # não cair no pior caso O(n^2), que acontece quando
    # o array já está ordenado
    @array.shuffle! if shuffle
    
    start = Time.now
    quickSort(0, @array.length-1)
    finish = Time.now
    
    # Calcula o tempo de processamento
    @elapsedTime = finish - start
    # Retorna a referência do array
    @array
  end
  
  private
    # Algoritmo principal
    def quickSort(first, last)
      if first < last
        # Partition retorna o índice+1 onde o
        # pivô foi posicionado dentro do array
        key = partition(first, last)
        # Recursão na metade inferior e superior,
        # a partir (ou até) "key"
        quickSort(first, key-1)
        quickSort(key+1, last)
      end
    end
    
    def partition(fist, last)
      # O pivô é o último elemento do vetor
      pivot = @array[last]
      i = fist - 1
      # Move todos os valores menores ou iguais ao pivô
      # para frente do array
      fist.upto(last-1) do |j|
        if @array[j] <= pivot
          i += 1
          @array[i], @array[j] = @array[j], @array[i]
        end
      end
      # O pivô assume a posição+1 do valor imediatamente menor ou igual
      # a ele no array
      @array[i+1], @array[last] = @array[last], @array[i+1]
      # Devolve o índice do array onde o pivô foi posicionado
      return i+1
    end
end