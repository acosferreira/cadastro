class AddColumnsIntoPessoas < ActiveRecord::Migration
  def self.up
    add_column :pessoas, :idioma, :string
    add_column :pessoas, :profissao, :string
    add_column :pessoas, :dt_conversao, :date
    add_column :pessoas, :pr_levantou, :string
    add_column :pessoas, :pr_responsavel, :string
    add_column :pessoas, :dt_batismo_aguas, :date
    add_column :pessoas, :dt_batismo_es, :date
    add_column :pessoas, :testemunho, :text
  end

  def self.down
    remove_column :pessoas, :idioma
    remove_column :pessoas, :profissao
    remove_column :pessoas, :dt_conversao
    remove_column :pessoas, :pr_levantou
    remove_column :pessoas, :pr_responsavel
    remove_column :pessoas, :dt_batismo_aguas
    remove_column :pessoas, :dt_batismo_es
    remove_column :pessoas, :testemunho
  end
end
