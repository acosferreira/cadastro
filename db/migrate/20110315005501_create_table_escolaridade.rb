class CreateTableEscolaridade < ActiveRecord::Migration
  def self.up
    create_table :escolaridades do|t|
      t.string :name
    end
  end

  def self.down
    drop_table :escolaridades
  end
end
