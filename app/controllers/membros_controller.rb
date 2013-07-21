class MembrosController < ApplicationController
   require 'pdf/writer'
   require "app/reports/templates"
    layout "application", :except => [:show]

  def index
  #  @loja_report = DailyPriceGatheringReport.render_html
  end

  def show
    funcao = params[:funcao]

    if funcao.empty?
      render :text => "<font color=\"green\">Escolha o Grupo</font> "
    else
    @membros = MembroReport.render_html(:funcao =>funcao)
    end
  end

  def pdf
     a="membros_#{Time.now.strftime('%m%d%H%M')}.pdf"
    @membros = MembroReport.render_pdf(:file =>a, :template=>:default)
    download(a)
  end


   def download
     funcao = params[:funcao]
     if funcao.empty?
      render :text => "<font color=\"green\">Escolha o Mês.</font> "
    else
     a="aniversariante#{Time.now.strftime('%m%d%H%M')}.pdf"
     @membros = MembroReport.render_pdf(:file =>a, :funcao =>funcao, :template=>:default)
     render :text => "<font color=\"green\">O PDF foi gerado.</font> <a href=\"/membros/down/#{a}\" style=\"color: blue\">Download.</a>"
     end
  end

   def down
     send_file  "#{RAILS_ROOT}/#{params[:id]}.#{params[:format]}", :type => 'text/txt', :disposition => 'inline'
  end

   #deletar o arquivo gerado#
   def del(a)
    File.delete("#{RAILS_ROOT}/#{a}")
    redirect_to(:controller => 'MembroReport', :action => 'index')
   end



end

 