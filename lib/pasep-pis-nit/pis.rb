module PasepPisNit
  class Pis
    # http://www.macoratti.net/alg_pis.htm
    attr_reader :numero

    def initialize(numero)
      @numero           = numero
      @match            = @numero =~ PASEP_PIS_NIT_REGEX
      @numero_puro      = $1
      @para_verificacao = $2
      @numero           = (@match ? format_number! : nil)
    end

    def to_s
      @numero || ''
    end

    def ==(outro_doc)
      self.numero == outro_doc.numero
    end

    # Verifica se o número possui o formato correto e se
    # constitui um número de documento válido
    def valido?
      return false unless @match
      verifica_numero
    end

    private
      PASEP_PIS_NIT_REGEX = /\A(\d{3}\.?\d{4}\.?\d{3})-?(\d)\Z/ # 125.6483.635-8
      PESO = %w(3 2 9 8 7 6 5 4 3 2)

      def verifica_numero
        @numero_puro.gsub!(/[\.\/-]/, '')
        return false if @numero_puro.length != 10

        total = soma_digitos

        resto = total % 11

        verificador = 11 - resto
        verificador = 0 if (verificador == 10 || verificador == 11)
        verificador.to_s == @para_verificacao
      end

      def soma_digitos
        soma = 0
        PESO.each_with_index { |p, idx| soma += p.to_i * @numero_puro[idx].to_i }
        soma
      end

      def format_number!
        @numero =~ /^(\d{3})\.?(\d{4})\.?(\d{3})-?(\d)$/
        @numero = "#{$1}.#{$2}.#{$3}-#{$4}"
      end
  end
end
