class AddColumnDtCasamentoIntoConjuje < ActiveRecord::Migration
  def self.up
    add_column :conjuges, :dt_casamento, :date
  end

  def self.down
    remove_column :conjuge, :dt_casamento
  end
end
