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

class BubbleSort
  attr_reader :elapsedTime
  
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
    bubbleSort()
  end
  
  # Sort não destrutivo
  def sort
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    # Duplica o array
    @array = @arrayOrigin.dup()
    
    start = Time.now
    bubbleSort()
    finish = Time.now
    
    # Calcula o tempo de processamento
    @elapsedTime = finish - start
    # Retorna a referência do array
    @array
  end
  
  private
    # Algoritmo principal
    def bubbleSort
      # Para cada valor do array...
      0.upto(@array.length-1) do |i|
        # ...busca um valor menor que ele.
        (i+1).upto(@array.length-1) do |j|
          # Se encontrar um valor menor que o seu, então os valores
          # das respectivas posições do array são trocadas
          if @array[i] > @array[j]
            @array[i], @array[j] = @array[j], @array[i]
          end #if
        end #loop
      end #loop
    end
end