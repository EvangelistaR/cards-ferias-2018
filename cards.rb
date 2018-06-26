=begin
**************************Pendencias**************************
 Ainda falta implementar a utilização do card emergencial (feito)
 Utilizar o 'select' para fazer a busca (feito)
 Procurar uma melhoria para o menu ~ Não efetuar chamada 2x ~

=end
require_relative 'emergencial_card'

INSERIR_CARD = 1
EXIBIR_CARD = 2
BUSCAR_CARD = 3
CARD_EMERGENCIAL = 4
SAIR = 5

def menu()
  puts
  puts "Digite a opção desejada:"
  puts "[1] - Inserir um novo card || [2] -  Exibir todos os cards"
  puts "[3] - Buscar um card       || [4] - Cards emergenciais "
  puts "[5] - Sair"
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

  cards.each do |i|
    if (i == card)
      puts 'Esse card já foi cadastrado!'
      ctrl = true
    end
  end

  cards << card
  puts "O card '#{card}' foi inserido com sucesso"
  return card
end

def imprime(cards)
  if cards.empty?
    puts 'Nenhum cartão foi inserido até o momento.'
  else
    puts 'Cartões inseridos: '
    puts
    cards.each do |card|
      card.imprimir()
    end
    puts
  end
end

def inserir_emergency(cards)
  puts 'Insira uma expressão em Português:'
  portugues = gets.chomp
  puts 'Insira uma expressão em Ingles:'
  ingles = gets.chomp

  card = EmergencialCard.new(portugues, ingles)

  cards << card
end

cards = []
card_emergencial = []
puts 'Bem vindo ao Cards System'
puts

opcao = menu()

while (opcao != SAIR) do
  if (opcao == INSERIR_CARD)
    puts
    inserir_cards(cards)

  elsif (opcao == EXIBIR_CARD)
    imprime(cards)
    imprime(card_emergencial)
    puts

  elsif (opcao == BUSCAR_CARD)
  #  puts 'Em qual idioma a busca será feita?'
  #  puts '[P] Português'
  #  puts '[I] Inglês'
  #  busca_idioma = gets.chomp.upcase


    print 'Entre com o card a ser buscado: '
    texto_busca = gets.chomp

    cards_encontrados = []
    cards_encontrados = cards.select do |c|
      c.include?(texto_busca)
    end

    if cards_encontrados.empty?
      puts "Nenhum cartão encontrado"
    else
      puts 'Cartões encontrados'
      puts cards_encontrados
    end

  elsif opcao == CARD_EMERGENCIAL
    # => TODO
    inserir_emergency(card_emergencial)


  elsif (opcao == SAIR)
    puts 'Obrigado por utilizar o Cards System'
  else
    puts 'entre com uma opcao válida'
    puts
  end
  opcao = menu()
end
