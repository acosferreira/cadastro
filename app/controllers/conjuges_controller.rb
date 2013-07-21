class ConjugesController < ApplicationController
  active_scaffold :conjuge do |config|
    config.columns = [ :pessoa, :name, :dt_casamento, :dt_nascimento, :tipo]
    config.columns[:tipo].form_ui = :select
    config.actions.exclude :delete,:edit, :update
  end

  end