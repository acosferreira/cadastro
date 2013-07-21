class AniversariantesController < ApplicationController
   require 'pdf/writer'
   require "app/reports/templates"
    layout "application", :except => [:show]

  def index
  #  @loja_report = DailyPriceGatheringReport.render_html
  end

  def show
    mes = params[:mes]
    
    if mes.empty?
      render :text => "<font color=\"green\">Escolha o Mês</font> "
    else
    @aniversariante = AniversarianteReport.render_html(:mes =>mes)
    end
  end

  def pdf
     a="aniversariante_#{Time.now.strftime('%m%d%H%M')}.pdf"
    @aniversariante = AniversarianteReport.render_pdf(:file =>a, :template=>:default)
    download(a)
  end


   def download
     mes = params[:mes]
     if mes.empty?
      render :text => "<font color=\"green\">Escolha o Mês.</font> "
    else
     a="aniversariante#{Time.now.strftime('%m%d%H%M')}.pdf"
     @aniversariante = AniversarianteReport.render_pdf(:file =>a, :mes =>mes, :template=>:default)
     render :text => "<font color=\"green\">O PDF foi gerado.</font> <a href=\"/aniversariantes/down/#{a}\" style=\"color: blue\">Download.</a>"
     end
  end

   def down
     send_file  "#{RAILS_ROOT}/#{params[:id]}.#{params[:format]}", :type => 'text/txt', :disposition => 'inline'
  end

   #deletar o arquivo gerado#
   def del(a)
    File.delete("#{RAILS_ROOT}/#{a}")
    redirect_to(:controller => 'AniversarianteReport', :action => 'index')
   end



end
