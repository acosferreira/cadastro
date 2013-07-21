class PessoasReuniaosController < ApplicationController
  active_scaffold :pessoas_reuniao do |config|
    config.columns = [:pessoa, :reuniao]
    config.actions.exclude :delete,:edit, :update
    config.label= "Escala de Obreiros"
  end
end