class CreateTableIdiomasPessoas < ActiveRecord::Migration
  def self.up
    create_table :idiomas_pessoas, :id=>false do |t|
      t.integer :pessoa_id
      t.integer :idioma_id
    end
  end

  def self.down
    drop_table :idiomas_pessoas
  end
end
