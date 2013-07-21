class AddColumnEscolaridadeIdInPessoa < ActiveRecord::Migration
  def self.up
    add_column :pessoas, :escolaridade_id, :integer
  end

  def self.down
    remove_column :pessoas, :escolaridade_id
  end
end
