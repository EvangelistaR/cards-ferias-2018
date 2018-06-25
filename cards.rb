require_relative 'card'

INSERIR_CARD = 1
EXIBIR_CARD = 2
BUSCAR_CARD = 3
SAIR = 4

def menu()
  puts
  puts "Digite a opção desejada"
  puts "[1] Inserir um novo card"
  puts "[2] Exibir todos os cards"
  puts "[3] Buscar um card"
  puts "[4] Sair"
  puts
  print 'Escolha uma opção: '
  gets.to_i

end

def inserir_cards(cards)
  puts 'Insira uma expressão em Português:'
  portugues = gets.chomp
  puts 'Insira uma expressão em Ingles:'
  ingles = gets.chomp

  card = Card.new(portugues,ingles)
  #variavel de controle
  ctrl = false

  cards.each do |i|
    if i == card
      puts 'Esse card já foi cadastrado!'
      ctrl = true
    end
  end
  
  if ctrl == false
    cards << Card
    puts "O card '#{card}' foi inserido com sucesso"
  end

  return card
end

def imprimir_cards(cards)
  puts 'Cartões inseridos:'
  puts
  cards.each do |card|
    cards.imprimir()
  end
  puts
end

 def buscar_cards(cartao)

 end

cards = []

puts 'Bem vindo ao Cards System'
puts

opcao = menu()

while (opcao != SAIR) do
  if (opcao == INSERIR_CARD)
    puts
    c = inserir_cards

  elsif (opcao == EXIBIR_CARD)
    imprimir_cards(cards)
    puts

  elsif (opcao == BUSCAR_CARD)
    puts 'Em qual idioma a busca será feita?'
    puts '[P] Português'
    puts '[I] Inglês'
    busca_idioma = gets.chomp.upcase


    print 'Entre com o card a ser buscado: '
    texto_busca = gets.chomp

    cards.each do |c|
      if (busca_idioma == "P")
        if c[:portugues].include? texto_busca
          imprimir_cards(c)
        end

      elsif (busca_idioma == "I")
        if c[:ingles].include? texto_busca
          imprimir_cards(c)
        end

      else
        puts 'Opção inválida!'
      end
    end

  elsif (opcao == SAIR)
    puts 'Obrigado por utilizar o Cards System'
  else
    puts 'entre com uma opcao válida'
    puts
  end
  opcao = menu()
end
