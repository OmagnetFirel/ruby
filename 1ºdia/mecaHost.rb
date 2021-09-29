class MegaAnfitriao

    #torna o atributo nomes editavel
    attr_accessor :nomes

    #inicializa o objeto
    def initialize(nomes = "Mundo")
        @nomes = nomes
    end

    def diz_ola
        if @nomes.nil?
            puts "..."
        elsif @nomes.respond_to?("each")
            #@nomes é uma lista de algum tipo!
            #assim podemos iterar
            @nomes.each do |nome|
                puts "Ola #{nome}"
            end
        else
            puts "Ola #{@nomes}"
        end
    end
    def diz_adeus
        if @nomes.nil?
            puts "..."
        elsif @nomes.respond_to?("join")
            #join = juntar elementos em uma lista
            #usando o parametro como separador
            puts "Adeus #{@nomes.join(", ")}. Voltem sempre"
        else
            puts "Adeus #{@nomes}. Volte sempre"
        end
    end
end

if __FILE__ == $0
    mg = MegaAnfitriao.new
    mg.diz_ola
    mg.diz_adeus


    #Altera o nome para victor
    mg.nomes = "Victor"
    mg.diz_ola
    mg.diz_adeus

    #Altera o nome para um vetor/array de nomes
    mg.nomes = ["Victor", "Ester", "Crystyan", "Natalia"]
    mg.diz_ola
    mg.diz_adeus


    #altera o nome para nill/nulo
    mg.nomes = nill
    mg.diz_ola
    mg.diz_adeus
end