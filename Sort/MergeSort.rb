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