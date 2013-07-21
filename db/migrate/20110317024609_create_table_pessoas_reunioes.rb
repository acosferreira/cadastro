class CreateTablePessoasReunioes < ActiveRecord::Migration
  def self.up
    create_table :pessoas_reuniaos, :id=>false do |t|
      t.integer :pessoa_id
      t.integer :reuniao_id
    end
  end

  def self.down
    drop_table :pessoas_reuniaos
  end
end
