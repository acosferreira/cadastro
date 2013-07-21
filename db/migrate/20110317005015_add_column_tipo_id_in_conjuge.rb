class AddColumnTipoIdInConjuge < ActiveRecord::Migration
  def self.up
    add_column :conjuges, :tipo_id, :integer
  end

  def self.down
    remove_column :conjuges, :tipo_id
  end
end
