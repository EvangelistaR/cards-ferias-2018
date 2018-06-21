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

def inserir_cards
  puts 'Insira uma expressão em Português:'
  portugues = gets.chomp
  puts 'Insira uma expressão em Ingles:'
  ingles = gets.chomp
  card = {portugues: portugues, ingles: ingles}
  return card
end

def imprimir_cards(cards)
  puts "PT-Br: #{cards[:portugues]} ||EN: #{cards[:ingles]}"
end

# def imprime_card(card)

#end

 def buscar_cards(cards)

 end

cards = []

puts 'Bem vindo ao Cards System'
puts

opcao = menu()

while (opcao != SAIR) do
  if (opcao == INSERIR_CARD)
    puts
    c = inserir_cards
    imprimir_cards(c)
    cards << c

  elsif (opcao == EXIBIR_CARD)
    cards.each do |card|
      imprimir_cards(card)
    end

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

      elsif
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
