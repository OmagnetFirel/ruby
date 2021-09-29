@lista = [
    {
        tarefa: "Banho",
        completa: true,
    },
    {
        tarefa: "Cafe",
        completa: false,
    }
]

def listar_tarefas
    puts "-------Listando todas as tarefas-------"
    @lista.each do |tarefa|
        puts "Tarefa:#{tarefa[:tarefa]} - completa:#{tarefa[:completa] ? "Sim" : "Não"}"
    end
    puts"-"*40
end

def adicionar_tarefa
    puts "-------Adicionando nova tarefa-------"
    print "Tarefa: "
    task = gets.chomp
    print "Completa[1:sim/2:não]: "
    completed = gets.chomp.to_i
    if completed == 1
        completed = true
    elsif completed >= 2
        completed = false
    end
    @lista << {tarefa:task,completa:completed}

    puts "-------Tarefa adicionada com sucesso-------"
end

def editar_tarefa
    puts "-------Editando tarefa-------"
    print "Nome da tarefa a ser editada: "
    task = gets.chomp
    @lista.each do |tarefa|
        if tarefa[:tarefa].downcase.include?(task.downcase)
            task_salva = tarefa[:tarefa]
            print("Nova tarefa[ENTER para manter o nome]: ")
            tarefa[:tarefa] = gets.chomp
            tarefa[:tarefa] = tarefa[:tarefa].empty? ? task_salva : tarefa[:tarefa]
            conclusao_antiga = tarefa[:completa]
            print("Alterar conclusão ? [ENTER para manter/ 'SIM' para trocar]: ")
            nova_conclusao = gets.chomp
            if nova_conclusao.empty?
                tarefa[:completa] = task_salva
            elsif nova_conclusao.downcase == 'sim'.downcase
                case tarefa[:completa]
                when true
                    tarefa[:completa] = false
                when false
                    tarefa[:completa] = true
                end
            end
        end
    end
    puts "---------Alteração realizada com sucesso------------"
end

def concluir_tarefa
    puts "-------Concluindo tarefa-------"
    print "Nome da tarefa a ser concluida: "
    nome = gets.chomp
    @lista.each do |tarefa|
        if tarefa[:tarefa].downcase.include?(nome.downcase)
            case tarefa[:completa]
            when true
                tarefa[:completa] = false
            when false
                tarefa[:completa] = true
            end
        end
    end
    puts "-------Tarefa concluida com sucesso-------"
end

def excluir_tarefa
    puts "-------Excluindo tarefas-------"
    print "Nome da tarefa a ser excluida: "
    nome = gets.chomp
    @lista.each do |tarefa|
        if tarefa[:tarefa].downcase == nome.downcase
            @lista.delete(tarefa)
        end
    end
    puts "-------Tarefa excluida com sucesso-------"
end

loop do
    puts "1-Listar todas as tarefas\n2-Adicionar tarefa\n3-Editar tarefa\n4-Concluir tarefa\n5-Excluir tarefa\n0-Sair..."
    print "Digite a opção desejada: "
    opcao = gets.chomp.to_i
    case opcao
    when 1
        listar_tarefas
    when 2
        adicionar_tarefa
    when 3
        editar_tarefa
    when 4
        concluir_tarefa
    when 5
        excluir_tarefa
    when 0
        puts "Saindo..."
        break
    else
        puts "Opção invalida..."
    end
end