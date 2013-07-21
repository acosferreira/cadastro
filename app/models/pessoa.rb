class Pessoa < ActiveRecord::Base
  
  named_scope :with_email, :conditions => "email is not null"
  named_scope :aniversariantes, :conditions => "email is not null and month(dt_nascimento) =month(now())"
  named_scope :membros, :conditions =>"email is not null and tipo_id = 1"
  named_scope :jovens, :conditions =>"email is not null and tipo_id = 2"
  named_scope :evangelistas, :conditions =>"email is not null and tipo_id = 3"
  named_scope :pa, :conditions =>"email is not null and tipo_id = 4"
  named_scope :tias, :conditions =>"email is not null and tipo_id = 5"
  named_scope :obreiros, :conditions =>"email is not null and tipo_id = 6"


  
  acts_as_reportable
  belongs_to :tipo
  belongs_to :estadocivil
  belongs_to :escolaridade
  has_one :conjuge
  has_many :filho
  has_and_belongs_to_many :reuniao
  has_and_belongs_to_many :idioma
  has_attached_file :picture, :styles => { :medium => "70x50>"},
    :url =>"/uploads/pessoas/:attachment/:id/:basename_:style.:extension",
    :path =>":rails_root/public/uploads/pessoas/:attachment/:id/:basename_:style.:extension"

  validates_presence_of :name, :endereco, :numero, :bairro, :cidade, :estadocivil,
    :rg, :cpf, :escolaridade, :profissao, :pr_levantou,
    :pr_responsavel

  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid"


  def print
    "Print"
  end
  
  def etiqueta
    "Aniversariantes do Mês"
  end

  def ficha(id, type)
    html = ""
    line_break = type == 'html'? '<br/>' : "\n"
    a = []
    b = []
    pessoa = Pessoa.find_by_id(id)
    idioma = IdiomasPessoa.find_by_sql("select * from idiomas_pessoas where pessoa_id = #{id}")
    idioma.each do |ip|
      a<< ip.idioma.name
    end

    escala = PessoasReuniao.find_by_sql("select * from pessoas_reuniaos where pessoa_id = #{id}")
    escala.each do |rp|
      b<< rp.reuniao.name
    end

    filho =Filho.find_by_sql("select dt_nascimento from filhos where pessoa_id =#{id}")

    html << line_break
    html << line_break
    html << "Nome: #{pessoa.name}"
    html << line_break
    html << "Endereço: #{pessoa.endereco} - Nº: #{pessoa.numero} - Complemento: #{pessoa.complemento}"
    html << line_break
    html << "Bairro: #{pessoa.bairro}          Cidade: #{pessoa.cidade} - UF: #{pessoa.uf} - CEP: #{pessoa.cep}"
    html << line_break
    html << "Telefone: #{pessoa.telefone}          Email: #{pessoa.email}"
    html << line_break
    html << "Data de Nascimento: #{pessoa.dt_nascimento}          Nacionalidade: #{pessoa.nacionalidade}          Naturalidade: #{pessoa.naturalidade}"
    html << line_break
    html << "Estado Civil: #{pessoa.estadocivil.name}"
    html << line_break
    html << line_break
    html << "Documentação"
    html << line_break
    html << "RG: #{pessoa.rg}          Expedição: #{pessoa.rg_expedicao}          CPF: #{pessoa.cpf}"
    html << line_break
    html << "Passaporte: #{pessoa.passaporte}          Expedição: #{pessoa.passaporte_expedicao}          Data de Validade: #{pessoa.passaporte_validade}"
    html << line_break
    html << "Titulo de Eleitor: #{pessoa.titulo_eleitor}          Zona: #{pessoa.zona}          Seção: #{pessoa.secao}"

    html << line_break
    html << line_break
    html << "Escolaridade"
    html << line_break
    html << "Grau de Instrução: #{pessoa.escolaridade.name}"
    html << line_break
    html << "Idioma: #{a}"
    html << line_break
    html << "Profissão: #{pessoa.profissao}"
    html << line_break
    html << line_break

    html << "Dados do Conjuge"
    html << line_break
    html << "Nome: #{pessoa.conjuge.name}"
    html << line_break
    html << "Data do Casamento: "
    html << line_break
    html << "Data de Nascimento: #{pessoa.conjuge.dt_nascimento}"
    html << line_break
    html << "Função: #{pessoa.conjuge.name}"
    html << line_break
    html << line_break

    html << "Dados dos Filhos"
    html << line_break
    html << "Nome: #{pessoa.filho.name}          Data de Nascimento:#{filho}"
    html << line_break
    html << line_break

    html << "Histórico do #{pessoa.tipo.name}"
    html << line_break
    html << "Data de Conversão: "
    html << line_break
    html << "Quem o levantou: #{pessoa.pr_levantou}          Pastor Responsavel: #{pessoa.pr_responsavel}"
    html << line_break
    html << "Data do Batismo nas Águas: #{pessoa.dt_batismo_aguas}          Data do Batismo no Espirito Santo: #{pessoa.dt_batismo_es}"
    html << line_break
    html << "Inicio na Obra: "
    html << line_break
    html << "Testemunho: #{pessoa.testemunho}"
    html << line_break
    html << "Escala: #{b}"

    html
  end
  

  def mala(id, type)
    html = ""
    line_break = type == 'html'? '<br/>' : "\n"
    #pessoa = Pessoa.find_by_id(id)
    pessoa=Pessoa.find(:all, :conditions=>["month(dt_nascimento)=?", '02'])

    pessoa.each do |p|
      html << line_break
      html << "Nome: #{pessoa.name}"
      html << line_break
      html << "Endereço: #{pessoa.endereco} - Nº: #{pessoa.numero} - Complemento: #{pessoa.complemento}"
      html << line_break
      html << "Bairro: #{pessoa.bairro}          Cidade: #{pessoa.cidade} - UF: #{pessoa.uf} - CEP: #{pessoa.cep}"
      html << line_break
    end
  end

  def aniversariante(mes)

    html = ""
    line_break = 'pdf' == 'html'? '<br/>' : "\n"

    pessoa=Pessoa.find(:all, :conditions=>["month(dt_nascimento)=?", '01'])

    pessoa.each do |p|
      html << line_break
      html << "Nome: #{p.name[0..20]}"
      html << line_break
      html << "Endereço: #{p.endereco} - Nº: #{p.numero} - Complemento: #{p.complemento}"
      html << line_break
      html << "Bairro: #{p.bairro} - Cidade: #{p.cidade} - UF: #{p.uf} - CEP: #{p.cep}"
      html << line_break

    end

    html
  end

  
  def deliver(newsletter)
    Notifier.deliver_signup_newsletter(self, newsletter)
  end
end