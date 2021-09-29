class Anfitriao
    def initialize(nome = "Mundo")
        @nome = nome
    end
    def cumprimenta
        puts "olá #{@nome}, tudo bem com você?"
    end
    def seDespede
        puts "Até mais #{@nome}, chegar em casa me avisa!"
    end
    def seOferece
        puts "Deseja que eu faça algo para você #{@nome}!!!!"
    end

end

h = Anfitriao.new("Ester")

h.cumprimenta
h.seOferece
h.seDespede

