class CreateTableIdiomas < ActiveRecord::Migration
  def self.up
    create_table :idiomas do |t|
      t.string :name

    end
  end

  def self.down
    drop_table :idiomas
  end
end
