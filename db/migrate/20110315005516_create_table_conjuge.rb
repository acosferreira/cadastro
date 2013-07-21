class CreateTableConjuge < ActiveRecord::Migration
  def self.up
    create_table :conjuges do |t|
      t.string :name
      t.date :dt_nascimento

    end
  end

  def self.down
    drop_table :conjuges
  end
end
