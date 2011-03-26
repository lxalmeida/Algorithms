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

class HeapSort
  attr_reader :elapsedTime
  
  def initialize(array=nil)
    @arrayOrigin = array
    @array = nil
    # Variável que controla o tamanho do heap
    @heapSize = array.length-1
  end
  
  def array=(array)
    @arrayOrigin = array
    @array = nil
  end
  
  # Sort destrutivo (altera os valores do array original)
  def sort!
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    @array = @arrayOrigin
    heapSort()
  end
  
  # Sort não destrutivo
  def sort
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    @array = @arrayOrigin.dup
    heapSort()
    @array
  end
  
  private
    # Algoritmo principal
    def heapSort
      start = Time.now
      # Constrói o heap máximo
      buildMaxHeap()
      # Joga os valores da raiz do max-heap para o final do vetor
      # até percorrer todo o heap. Ao final é obtido um vetor ordenado.
      (@array.length-1).downto(1) do |i|
        # Isso é uma troca de 2 valores em Ruby. Não é lindo? :o)
        # Valor da raiz vai para o final.
        @array[0], @array[i] = @array[i], @array[0]
        # Como o sorting é inplace, a variável heapSize controla o
        # tamanho do max-heap. A cada valor raiz que é deslocado para
        # o final, diminui o heap. Assim, o método maxHeapify não mexe
        # nos valores posicionados no final do vetor
        @heapSize -= 1
        # Mantém a propriedade de heap máximo. Isso desloca o valor máximo
        # da árvore para a raiz.
        maxHeapify(0)
      end
      
      finish = Time.now
      @elapsedTime = finish - start
    end
  
    # Constrói um heap máximo.
    def buildMaxHeap
      (@heapSize/2).downto(0) do |i|
        maxHeapify(i)
      end
    end
  
    # Mantém o heap máximo
    def maxHeapify(parent)
      # Calcula os índices dos filhos à esquerda e à direita
      left = (parent << 1) + 1  # Filho à esquerda está no índice 2*parent+1
      right = (parent << 1) + 2 # Filho à direita está no índice 2*parent+2
      
      # As comparações subsequentes obtém o índice do filho com maior valor
      if left <= @heapSize and @array[left] > @array[parent]
        largest = left # O filho à esquerda tem valor maior que o pai
      else
        largest = parent # O pai tem maior valor que o filho à esquerda
      end
      
      if right <= @heapSize and @array[right] > @array[largest]
        largest = right # O filho à direita tem maior valor que o pai
      end
      
      # Se um dos filhos tiver um valor maior que o pai, então o respectivo
      # filho toma o lugar do pai no max-heap
      if parent != largest
        @array[parent], @array[largest] = @array[largest], @array[parent] 
        
        # Chama maxHeapify para a sub-árvore
        maxHeapify(largest)
      end
    end
    
    # Verifica a consistencia do heap na sub-árvore "parent".
    # Esse método é útil apenas para fins de depuração de código.
    def checkHeapConsistency(parent)
      parent.upto(@heapSize) do |i|
        left = (i << 1) + 1
        right = (i << 1) + 2
        
        if left <= @heapSize and @array[i] < @array[left]
          raise Exception, "MaxHeap inconsistente: i = " + i.to_s + "; filho esquerdo maior que pai"
        end
        
        if right <= @heapSize and @array[i] < @array[right]
          raise Exception, "MaxHeap inconsistente: i = " + i.to_s + "; filho direito maior que pai"
        end
      end
    end
end