class CreateTableTipo < ActiveRecord::Migration
  def self.up
    create_table :tipos do |t|
      t.string :name

    end
  end

  def self.down
    drop_table :tipos
  end
end
