class EscalasController < ApplicationController
  require 'pdf/writer'
  require "app/reports/templates"
  layout "application", :except => [:show]

  def index
    #  @loja_report = DailyPriceGatheringReport.render_html
  end

  def show
    funcao = params[:funcao]
    reuniao = params[:reuniao]

    if funcao.empty? or reuniao.empty?
   
      render :text => "<font color=\"green\">Escolha o Mês</font> "
    else
      @escala = EscalaReport.render_html(:funcao =>funcao, :reuniao=>reuniao)
    end
  end

  def pdf
    a="aniversariante_#{Time.now.strftime('%m%d%H%M')}.pdf"
    @escala = EscalaReport.render_pdf(:file =>a, :template=>:default)
    download(a)
  end


  def download
    funcao = params[:funcao]
    reuniao = params[:reuniao]

    if funcao.empty? or reuniao.empty?
      render :text => "<font color=\"green\">Escolha o Grupo e Reuniao.</font> "
    else
      a="aniversariante#{Time.now.strftime('%m%d%H%M')}.pdf"
      @escala = EscalaReport.render_pdf(:file =>a, :funcao =>funcao,:reuniao=>reuniao, :template=>:default)
      render :text => "<font color=\"green\">O PDF foi gerado.</font> <a href=\"/escalas/down/#{a}\" style=\"color: blue\">Download.</a>"
    end
  end

  def down
    send_file  "#{RAILS_ROOT}/#{params[:id]}.#{params[:format]}", :type => 'text/txt', :disposition => 'inline'
  end

  #deletar o arquivo gerado#
  def del(a)
    File.delete("#{RAILS_ROOT}/#{a}")
    redirect_to(:controller => 'EscalaReport', :action => 'index')
  end



end
