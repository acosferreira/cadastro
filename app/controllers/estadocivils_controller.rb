class EstadocivilsController < ApplicationController
  active_scaffold :estadocivil do |config|
    config.columns = [ :name]

  end
end