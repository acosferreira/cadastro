class ReuniaosController < ApplicationController
  active_scaffold :reuniao do |config|
    config.columns = [:name, :horario]
config.label= "Reuniões"

  end
end