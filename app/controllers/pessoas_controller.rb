class PessoasController < ApplicationController
  active_scaffold :pessoa do |config|
    config.columns = [:picture,  :name,:email, :tipo,:endereco, :numero, :complemento, :bairro, :cidade, :uf,
      :cep,:telefone,:dt_nascimento,:escolaridade,:idioma, :profissao, :estadocivil, :conjuge,:filho,:nacionalidade,:naturalidade,
      :rg,:rg_expedicao,:cpf,:passaporte,:passaporte_expedicao,:passaporte_validade,:titulo_eleitor,
      :zona,:secao,:dt_conversao, :pr_responsavel, :pr_levantou, :dt_batismo_aguas, :dt_batismo_es,:testemunho,  :reuniao,:print, :etiqueta]
    config.list.columns = [:picture, :tipo, :name,:endereco, :numero, :complemento, :bairro, :telefone,
      :dt_nascimento, :tipo,:estadocivil, :print]
    config.show.columns = [:picture, :tipo,:endereco, :numero, :complemento, :bairro, :cidade, :uf, :cep,
      :telefone,:dt_nascimento,:escolaridade, :conjuge, :filho, :reuniao]
    config.create.columns.exclude :print, :etiqueta
    config.update.columns.exclude :print, :etiqueta
    config.show.columns.exclude :print, :etiqueta

    config.label= "Membros"
    config.columns[:dt_nascimento].form_ui = :calendar_date_select
    config.columns[:tipo].form_ui = :select
    config.columns[:escolaridade].form_ui = :select
    config.columns[:estadocivil].form_ui = :select
    config.columns[:reuniao].form_ui = :select
    config.columns[:idioma].form_ui = :select
    config.actions.exclude :delete

    config.columns[:print].set_link "Print", :inline => false, 
      :type => :table, :disposition => 'inline', :action=>:print_register
                            
    config.columns[:etiqueta].set_link "Aniversariante do Mês", :inline => false,
      :type => :table, :disposition => 'inline', :action=>:mala

    config.list.per_page = 20
  end

  def print_register
    prawnto :prawn=>{:page_layout=>:landscape}
    @pessoa = Pessoa.find_by_id(params[:id])
    respond_to do |format|
      puts 'entrei no respond to '
      #format.js
      format.pdf {render :layout => false}
    end
  rescue Exception => e
    logger.error e
  end

  def mala
    prawnto :prawn => {:left_margin => 0.21975,
      :right_margin => 0.21975}
    #@pessoa = Pessoa.find_by_id(params[:id])
    @pessoa = Pessoa.find(:all, :conditions=>["month(dt_nascimento)=?", '02'])
    respond_to do |format|
      format.pdf {render :layout => false}
    end
  rescue Exception => e
    logger.error e
  end

  def aniversariante
    prawnto :prawn => {:left_margin => 0.21975,
      :right_margin => 0.21975}
    @pessoa=Pessoa.aniversariante('02')
 
    respond_to do |format|
      format.pdf {render :layout => false}
    end
 
  rescue Exception => e
    logger.error e
  end
  
end

