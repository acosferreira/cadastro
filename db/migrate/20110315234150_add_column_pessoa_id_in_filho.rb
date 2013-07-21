class AddColumnPessoaIdInFilho < ActiveRecord::Migration
  def self.up
    add_column :filhos, :pessoa_id, :integer
  end

  def self.down
    remove_column :filhos, :pessoa_id
  end
end
