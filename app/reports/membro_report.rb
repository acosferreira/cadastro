class MembroReport < Ruport::Controller
  stage :list
  require 'ruport/acts_as_reportable'
  require 'pdf/writer'
  require "app/reports/templates"

  def setup
    conditions =["tipo_id= #{options.funcao}"]
    if options.funcao.empty?

      self.data=Pessoa.report_table_by_sql("select 'Escolha o grupo que deseja listar' from dual")

    else
      self.data= Pessoa.report_table_by_sql("select name a  from pessoas
                                            where #{conditions} order by name asc")
      data.rename_columns("a"=>"Nome"  )
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
        add_text "Grupo", :font_size => 20,:justification => :center
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
