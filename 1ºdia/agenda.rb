##Agenda em ruby puro

@agenda = [
    {nome:"Victor", telefone:"219999-9999"},
    {nome:"Ester", telefone:"229999-9999"},
]

def ver_contatos
    puts "#" * 40
    @agenda.each do |contato|
        puts "Nome:#{contato[:nome]} - telefone:#{contato[:telefone]}"
        puts "-"*40
    end
    puts "#" * 40
end

def adicionar_contato
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp
    @agenda << {nome: nome, telefone: telefone}
end

def buscar_contato
    puts "Deseja buscar por :\n1-nome\n2-telefone"
    opcao = gets.chomp.to_i
    case opcao
    when 1
        print "Nome: "
        nome = gets.chomp
        puts "#"*40
        @agenda.each do |contato|
            #forma de verificar mais dahora
            if contato[:nome].downcase.include?(nome.downcase)
                puts "Nome:#{contato[:nome]} - telefone:#{contato[:telefone]}"
            end
        end
        puts "#"*40
    when 2
        print "Telefone: "
        telefone = gets.chomp
        puts "#"*40
        @agenda.each do |contato|
            #forma de verificar mais generica
            if contato[:telefone] == telefone
                puts "Nome:#{contato[:nome]} - telefone:#{contato[:telefone]}"
            end
        end
        puts "#"*40
    end
end


def editar_contato
    puts "#"*40
    print "Nome do contato:"
    nome = gets.chomp
    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            nomeSalvo = contato[:nome]
            print "Novo nome[pressione ENTER para manter o anterior]: "
            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nomeSalvo : contato[:nome]
            print "Novo telefone[pressione ENTER para manter o anterior]: "
            telefoneSalvo = contato[:telefone]
            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefoneSalvo : contato[:telefone]
        end
    end
    puts "#"*40
end

def excluir_contato
    puts "#"*40
    print "Nome do contato:"
    nome = gets.chomp
    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            @agenda.delete(contato)
        end
    end
    puts "#"*40
end


loop do
    puts "1-Ver todos os contatos\n2-Adicionar contatos\n3-Ver contato\n4-Editar contatos\n5-Excluir contatos\n0-Sair"
    print "Digite a opção desejada: "
    opcao = gets.chomp.to_i
    case opcao
        when 1
            ver_contatos
        when 2
            adicionar_contato
        when 3
            buscar_contato
        when 4
            editar_contato
        when 5
            excluir_contato
        when 0
            puts "Saindo..."
            break
        else
            puts "Opção inválida"
        end
end