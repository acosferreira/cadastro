class IdiomasController < ApplicationController
  active_scaffold :idioma do |config|
    config.columns = [:name]
  end
end