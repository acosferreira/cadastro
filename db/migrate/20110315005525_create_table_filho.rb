class CreateTableFilho < ActiveRecord::Migration
  def self.up
    create_table :filhos do |t|
      t.string :name
      t.date :dt_nascimento
    end
  end

  def self.down
    drop_table :filhos
  end
end
