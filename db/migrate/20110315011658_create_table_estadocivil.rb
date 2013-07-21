class CreateTableEstadocivil < ActiveRecord::Migration
  def self.up
    create_table :estadocivils do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :estadocivils
  end
end
