class AniversarianteReport < Ruport::Controller
  stage :list
  require 'ruport/acts_as_reportable'
  require 'pdf/writer'
  require "app/reports/templates"

  def setup

  
    conditions =["month(dt_nascimento)= #{options.mes}"]
    if options.mes.empty?

      self.data=Pessoa.report_table_by_sql("select 'Escolha o mês que deseja listar' from dual")

    else
      self.data= Pessoa.report_table_by_sql("select name a , dt_nascimento b from pessoas
                                            where #{conditions} order by dt_nascimento asc")
      data.rename_columns("a"=>"Nome", "b"=>"Data de Aniversário"  )
    end
  end
  formatter :html do
    build :list do

      output << data.to_html

    end
  end

  formatter :pdf do
    build :list do
      pad(20) do
        add_text "Aniversariantes do Mês", :font_size => 20,:justification => :center
      end
      draw_table data
    end
  end

  formatter :csv do
    build :list do
      output << data.to_csv
    end
  end
end
