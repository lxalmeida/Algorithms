class InsertionSort
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
    insertionSort(0, @array.length-1)
  end
  
  # Sort não destrutivo
  def sort
    raise Exception, "Array is not set" if @arrayOrigin.nil?
    
    # Duplica o array
    @array = @arrayOrigin.dup()
    
    start = Time.now
    insertionSort()
    finish = Time.now
    
    # Calcula o tempo de processamento
    @elapsedTime = finish - start
    # Retorna a referência do array
    @array
  end
  
  private
    # Algoritmo principal
    def insertionSort
      i = 0
      1.upto(@array.length()-1) do |j|
        key = @array[j]
        i = (j-1)
        (j-1).downto(0) do
          if @array[i] <= key
            break
          end
          @array[i+1] = @array[i]
          i -= 1
        end
        @array[i+1] = key
      end
    end
end