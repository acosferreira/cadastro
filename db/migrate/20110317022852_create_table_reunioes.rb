class CreateTableReunioes < ActiveRecord::Migration
  def self.up
    create_table :reuniaos do |t|
      t.string :name
      t.time :horario
    end
  end

  def self.down
    drop_table :reuniaos
  end
end
