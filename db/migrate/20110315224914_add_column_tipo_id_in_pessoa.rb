class AddColumnTipoIdInPessoa < ActiveRecord::Migration
  def self.up
    add_column :pessoas, :tipo_id, :integer
  end

  def self.down
    remove_column :pessoas, :tipo_id, :integer
  end
end
