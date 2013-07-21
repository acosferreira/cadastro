class AddColumnEstadocivilIdIntoPessoa < ActiveRecord::Migration
  def self.up
    add_column :pessoas, :estadocivil_id, :integer
  end

  def self.down
    remove_column :pessoas, :estadocivil_id
  end
end
