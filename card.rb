Class Card
  attr_accessor :ingles, :portugues

  def initialize(pt, en = "")
    @portugues = pt
    @ingles = en
  end

  def imprimir()
    puts "Cartão: #{to_s()}"
  end

  def to_s
      "#{portugues()} -> #{ingle()} "
  end

  def ==(outro_cartao)
      if portugues() == outro_cartao.portugues() &&
          ingles() == outro_cartao.ingles()
        return true
      else
        return false
      end
  end


  def include?(texto)
    portugues().include?(texto) || ingles().include? (texto)
  end
