class Cachorro
    def initialize(nome = "Doggineo")
        @nome = nome
    end
    def habilidades(habilidade)
        @habilidade = habilidade
        puts "O cachorro sabe sentar e #{@habilidade}"
    end
    def fale
        puts "auauauau"
    end
end

dog = Cachorro.new("Pipoca")

dog.habilidades("Dormir")

dog.fale