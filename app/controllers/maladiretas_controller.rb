class MaladiretasController < ApplicationController

  def etiqueta
    prawnto :prawn => {:left_margin => 0.21975.in,
      :right_margin => 0.21975.in}
@pessoa = Pessoa.find_by_id(params[:id])
    respond_to do |format|
     
      format.pdf {render :layout => false}
    end
  rescue Exception => e
    logger.error e
  end
end