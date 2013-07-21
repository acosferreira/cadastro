class AddTipoEnvioInNewsLetter < ActiveRecord::Migration
  def self.up
    add_column :create_newsletters, :tipo_id, :integer
  end

  def self.down
    remove_column :create_newsletters, :tipo_id
  end
end
