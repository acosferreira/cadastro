class FilhosController < ApplicationController
  active_scaffold :filho do |config|
    config.columns = [:pessoa, :name, :dt_nascimento]
     config.actions.exclude :delete,:edit, :update
  end
end
