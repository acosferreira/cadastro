class EscolaridadesController < ApplicationController
  active_scaffold :escolaridade do |config|
  config.label= "Grau de Instrução"
  end
end
