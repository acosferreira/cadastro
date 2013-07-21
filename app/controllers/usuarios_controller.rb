class UsuariosController < ApplicationController
  active_scaffold :usuario do |config|
    config.columns=[:login, :email, :password]
    config.list.columns.exclude :password
    config.actions.exclude :delete, :update, :show
    config.columns[:password].form_ui = :password
  end

end
