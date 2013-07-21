class IdiomasPessoasController < ApplicationController
  active_scaffold :idiomas_pessoa do |config|
    config.columns = [:pessoa, :idioma]
    config.actions.exclude :delete,:edit, :update
  end
end