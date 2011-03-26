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