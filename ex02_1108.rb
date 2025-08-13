class Metrica
  def initialize(valor)
    @valor = valor
  end

  def converter(metrica)
    metrica.new(@valor * @conversoes[metrica]).to_s
  end

  def to_s
    @valor.to_s + ' ' + @tipo
  end
end

# conversão: 1 pol = 2,54 cm
# impressão da instância: valor + métrica. Exemplo: 13,00 cm
# precisão: 2 casas decimais. Sugestão: usa inteiros
# Criar Jarda 1 jd = 91,44 cm. Como converter para polegadas e centímetros?

class BRL < Metrica
  def initialize(valor)
    @tipo = 'reais'
    @conversoes = {
      USD => 0.1856,
      JPY => 1.0 / 0.03646
    }
    super(valor)
  end
end

class USD < Metrica
  def initialize(valor)
    @tipo = 'dolares'
    @conversoes = {
      BRL => 1.0 / 0.1856,
      JPY => 1.0 / 0.006764
    }
    super(valor)
  end
end

class JPY < Metrica
  def initialize(valor)
    @tipo = 'yen'
    @conversoes = {
      BRL => 0.03646,
      USD => 0.006764
    }
    super(valor)
  end
end

brl = BRL.new(100)
puts brl
puts 'Convertendo para dolares:'
puts brl.converter(USD)

puts "\n"

usd = USD.new(5)
puts usd
puts 'Convertendo para reais:'
puts usd.converter(BRL)
