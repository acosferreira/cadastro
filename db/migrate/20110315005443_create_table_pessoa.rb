class CreateTablePessoa < ActiveRecord::Migration
  def self.up
    create_table :pessoas do |t|
      t.string :name
      t.string :endereco
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :cep
      t.string :telefone
      t.date :dt_nascimento
      t.string :nacionalidade
      t.string :naturalidade
      t.integer :rg
      t.date :rg_expedicao
      t.integer :cpf
      t.string :passaporte
      t.date :passaporte_expedicao
      t.date :passaporte_validade
      t.integer :titulo_eleitor
      t.integer :zona
      t.integer :secao

    end


  end

  def self.down
    drop_table :pessoas
        
  end
end


