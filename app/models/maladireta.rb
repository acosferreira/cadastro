class Maladireta < ActiveRecord::Base
  def etiqueta(id, type)
    html = ""
    line_break = type == 'html'? '<br/>' : "\n"

    pessoa = Pessoa.find_by_id(id)
    html << line_break
    html << "Nome: #{pessoa.name}"
    html << line_break
    html << "Endereço: #{pessoa.endereco} - Nº: #{pessoa.numero} - Complemento: #{pessoa.complemento}"
    html << line_break
    html << "Bairro: #{pessoa.bairro}          Cidade: #{pessoa.cidade} - UF: #{pessoa.uf} - CEP: #{pessoa.cep}"
    html << line_break
  end

end